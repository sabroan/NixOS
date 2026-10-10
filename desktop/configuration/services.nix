{ config, lib, ... }: {
  imports = [
    ./services/lact.nix
    ./services/pipewire.nix
  ];
  services = {
    dbus = {
      enable = true;
    };
    desktopManager = {
      gnome = {
        enable = true;
      };
    };
    displayManager = {
      autoLogin = {
        enable = true;
        user = builtins.head (
          lib.attrNames (lib.filterAttrs (_: user: user.isNormalUser) config.users.users)
        );
      };
      gdm = {
        enable = true;
      };
    };
    fstrim = {
      enable = true;
    };
    gnome = {
      core-apps = {
        enable = false;
      };
      core-developer-tools = {
        enable = false;
      };
      gnome-keyring = {
        enable = true;
      };
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
    orca = {
      enable = false;
    };
    power-profiles-daemon = {
      enable = true;
    };
    pulseaudio = {
      enable = false;
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
    xserver.xkb = {
      layout = "us,ua";
      variant = "";
    };
  };
}
