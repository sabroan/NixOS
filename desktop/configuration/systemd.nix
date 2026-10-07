{ ... }: { # lib, 
  systemd = {
    coredump = {
      enable = true;
      settings = {
        Coredump = {
          MaxUse = "64M";
          ProcessSizeMax = "64M";
          Storage = "journal";
        };
      };
    };
    network = {
      networks = {
        "10-wireless" = {
          matchConfig = {
            Name = "wl*";
          };
          networkConfig = {
            DHCP = "ipv4";
          };
        };
      };
    };
    oomd = {
      enable = false;
    };
    services = {
      systemd-networkd-wait-online = {
        enable = false; # lib.mkDefault false;
      };
      systemd-udev-settle = {
        enable = false;
      };
    };
    tmpfiles = {
      rules = [
        "d /mount/nvme2 2775 root users -"
        "w /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference - - - - power"
      ];
    };
  };
}
