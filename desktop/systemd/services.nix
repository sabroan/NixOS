{ lib, ... }: {
  systemd.services = {
    systemd-networkd-wait-online = {
      enable = lib.mkDefault false;
    };
    systemd-udev-settle = {
      enable = false;
    };
  };
}
