{ lib, pkgs, ... }: {
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
    oomd = {
      enable = false;
    };
    services = {
      set-power-saver = {
        description = "Set power profile to Power Saver";
        wantedBy = [ "graphical.target" ];
        after = [ "power-profiles-daemon.service" ];
        requires = [ "power-profiles-daemon.service" ];
        serviceConfig = {
          Type = "oneshot";
          ExecStart = "${lib.getExe' pkgs.power-profiles-daemon "powerprofilesctl"} set power-saver";
        };
      };
      systemd-networkd-wait-online = {
        enable = false;
      };
      systemd-udev-settle = {
        enable = false;
      };
    };
    tmpfiles = {
      rules = [
        "w /sys/devices/system/cpu/cpu*/cpufreq/energy_performance_preference - - - - power"
      ];
    };
  };
}
