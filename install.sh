#!/usr/bin/env bash
set -euo pipefail

HOST="${1:?Usage: ${0} <hostname>}"
CURRENT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
STATE_DIR="/mnt/nix/state"
ROOT_DIR="${STATE_DIR}/root"
ETC_DIR="${ROOT_DIR}/etc"
SECRETS_DIR="${ETC_DIR}/secrets"
ETC_NIX_DIR="${ETC_DIR}/nixos"

read -rp "Run Disko (this WILL wipe all targeted disks)? [y|Y]: " CONFIRM_DISKO

if [[ "${CONFIRM_DISKO:-}" =~ ^[Yy]$ ]]; then
  echo "Running Disko formatting and mounting..."
  nix --extra-experimental-features "nix-command flakes" run github:nix-community/disko -- --mode destroy,format,mount --yes-wipe-all-disks "${CURRENT_DIR}/${HOST}/disko.nix"
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

USER_CONFIG_FILE="${CURRENT_DIR}/${HOST}/users/${TARGET_USER}.nix"

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

mkdir -p "${ETC_NIX_DIR}"
rm -rf "${ETC_NIX_DIR:?}/*"
cp -a "${CURRENT_DIR}/." "${ETC_NIX_DIR}"

cd "${ETC_NIX_DIR}"

nix --extra-experimental-features "nix-command flakes" flake update --commit-lock-file || true

nixos-install --no-root-passwd --root /mnt --flake path:"${ETC_NIX_DIR}#${HOST}" --option 'extra-substituters' 'https://nyx-cache.chaotic.cx/' --option extra-trusted-public-keys "nyx-cache.chaotic.cx:dJxTrgMC3V3cFfyIiBQDQorG6k1LsqurH/srpMSq7qk="

echo "Installation complete! You can reboot now."
