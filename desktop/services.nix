{
  config,
  lib,
  load,
  ...
}:
{
  imports = load.children ./services;
  services = {
    dbus = {
      enable = true;
    };
    fstrim = {
      enable = true;
    };
    getty = {
      autologinOnce = true;
      autologinUser = builtins.head (
        lib.attrNames (lib.filterAttrs (_: user: user.isNormalUser) config.users.users)
      );
    };
    gvfs = {
      enable = true;
    };
    journald = {
      settings = {
        Journal = {
          Storage = "volatile";
          RuntimeMaxUse = "64M";
          SystemMaxUse = "64M";
          MaxRetentionSec = "1week";
        };
      };
    };
    printing = {
      enable = false;
    };
    resolved = {
      enable = true;
    };
    scx = {
      enable = true;
      scheduler = "scx_lavd";
    };
    speechd = {
      enable = false;
    };
    timesyncd = {
      enable = true;
      settings = {
        Time = {
          PollIntervalMinSec = 3600;
          PollIntervalMaxSec = 14400;
        };
      };
    };
    udisks2 = {
      enable = true;
    };
  };
}
