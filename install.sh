#!/usr/bin/env bash
set -euo pipefail

HOST="${1:?Usage: ${0} <hostname>}"
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="/mnt/nix/state";
FLAKES_DIR="${CURRENT_DIR}/flakes";
FLAKE_DIR="${STATE_DIR}/flake"
ROOT_DIR="${STATE_DIR}/root"
IWD_DIR="${ROOT_DIR}/var/lib/iwd"
SECRETS_DIR="${ROOT_DIR}/etc/secrets"

read -rp "Run Disko (this WILL wipe all targeted disks)? [y|Y]: " CONFIRM_DISKO

if [[ "${CONFIRM_DISKO:-}" =~ ^[Yy]$ ]]; then
  echo "Running Disko formatting and mounting..."
  nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount --yes-wipe-all-disks "${FLAKES_DIR}/${HOST}/disko.nix"
else
  echo "Assuming /mnt is already mounted. Verifying..."
  if ! mountpoint -q /mnt; then
    echo "Error: /mnt is not mounted! Mount your root partition first."
    exit 1
  fi
fi

MACHINE_ID_FILE="${ROOT_DIR}/etc/machine-id"
if ! test -f "${MACHINE_ID_FILE}"; then
  echo "Generating persistent machine-id..."
  mkdir -p -m 755 "$(dirname "${MACHINE_ID_FILE}")"
  systemd-id128 new | tee "${MACHINE_ID_FILE}" > /dev/null
  chmod 0444 "${MACHINE_ID_FILE}"
fi

mkdir -p -m 700 "${SECRETS_DIR}"

read -rp "Enter username: " TARGET_USER

USER_CONFIG_FILE="${FLAKES_DIR}/${HOST}/users/${TARGET_USER}.nix"

if [[ ! -f "${USER_CONFIG_FILE}" ]]; then
  echo "Error: User configuration '${TARGET_USER}' was not found."
  exit 1
fi

USER_SECRET_DIR="${SECRETS_DIR}/${TARGET_USER}"
USER_SECRET_FILE="${USER_SECRET_DIR}/password.psk"

if test -f "${USER_SECRET_FILE}"; then
  echo "Password already set for user ${TARGET_USER}. Skipping ..."
else
  while true; do
    read -sp "Enter password for ${TARGET_USER}: " PASS1
    echo
    read -sp "Confirm password: " PASS2
    echo
    if [[ "${PASS1}" == "${PASS2}" && -n "${PASS1}" ]]; then
      break
    fi
    echo "Passwords do not match or input was empty. Please try again."
  done

  mkdir -p -m 700 "${USER_SECRET_DIR}"
  
  printf '%s' "${PASS1}" | nix-shell -p whois --run "mkpasswd -m sha-512 -s" | tee "${USER_SECRET_FILE}" > /dev/null
  chmod 600 "${USER_SECRET_FILE}"
  unset PASS1 PASS2
  echo "Created password hash for ${TARGET_USER}."
fi

mkdir -p -m 700 "${IWD_DIR}"

read -rp "Enter Wi-Fi SSID (Network Name): " WIFI_SSID
if [[ -z "${WIFI_SSID:-}" ]]; then
  echo "SSID cannot be empty."
  exit 1
fi

WIFI_SECRET_FILE="${IWD_DIR}/${WIFI_SSID}.psk"
if test -f "${WIFI_SECRET_FILE}"; then
  echo "Wi-Fi profile for '${WIFI_SSID}' already exists. Skipping ..."
else
  read -sp "Enter Wi-Fi Password: " WIFI_PSK
  echo
  if [[ -n "${WIFI_PSK:-}" ]]; then
    cat <<EOF | tee "${WIFI_SECRET_FILE}" > /dev/null
[Security]
Passphrase=${WIFI_PSK}
EOF
    chown -R root:root "${IWD_DIR}"
    chmod 700 "${IWD_DIR}"
    chmod 600 "${WIFI_SECRET_FILE}"
    unset WIFI_PSK
    echo "Created Wi-Fi profile for '${WIFI_SSID}'."
  fi
fi


mkdir -p "${FLAKE_DIR}"
rm -rf "${FLAKE_DIR:?}/*"
cp -a "${FLAKES_DIR}/." "${FLAKE_DIR}"

cd "${FLAKE_DIR}"

nix --extra-experimental-features "nix-command flakes" flake update --commit-lock-file || true

nixos-install --no-root-passwd --root /mnt --flake "${FLAKE_DIR}#${HOST}" --option 'extra-substituters' 'https://nyx-cache.chaotic.cx/' --option extra-trusted-public-keys "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk="

echo "Installation complete! You can reboot now."
