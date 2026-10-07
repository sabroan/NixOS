{ ... }: {
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
      gdm = {
        enable = true;
      };
    };
    fstrim = {
      enable = true;
    };
    gnome = {

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
    # xserver = {
    #   enable = true;
    # };
  };

  # services.pulseaudio = {
  #   enable = false;
  # };
  # services.pipewire = {
  #   enable = true;
  #   alsa = {
  #     enable = true;
  #     support32Bit = true;
  #   };
  #   extraConfig = {
  #     pipewire = {
  #       "92-low-latency" = {
  #         "context.properties" = {
  #           "default.clock.max-quantum" = 512;
  #           "default.clock.min-quantum" = 32;
  #           "default.clock.quantum" = 128;
  #           "default.clock.rate" = 48000;
  #         };
  #       };
  #     };
  #   };
  #   jack = {
  #     enable = false;
  #   };
  #   pulse = {
  #     enable = true;
  #   };
  #   wireplumber = {
  #     enable = true;
  #     extraConfig = {
  #       "99-lower-microphone-priority" = {
  #         "monitor.alsa.rules" = [
  #           {
  #             matches = [
  #               { "node.name" = "alsa_output.usb-FIFINE_683_Microphone_FIFINE_683_Microphone-00.analog-stereo"; }
  #             ];
  #             actions = {
  #               update-props = {
  #                 "priority.driver" = 1;
  #                 "priority.session" = 1;
  #               };
  #             };
  #           }
  #         ];
  #       };
  #     };
  #   };
  # };

  # services.lact = {
  #   enable = true;
  #   settings = {
  #     daemon = {
  #       log_level = "info";
  #       admin_group = "wheel";
  #     };
  #     gpus = {
  #       "1002:747E-1002:0E37-0000:03:00.0" = {
  #         fan_control_enabled = true;
  #         fan_control_settings = {
  #           mode = "curve";
  #           temperature_key = "mem";
  #           interval_ms = 2500;
  #           curve = {
  #             "50" = 0.20;
  #             "60" = 0.25;
  #             "70" = 0.50;
  #             "80" = 0.75;
  #             "90" = 1.0;
  #           };
  #         };
  #         pmfw_options = {
  #           zero_rpm = false;
  #         };
  #         power_cap = 190.0;
  #         voltage_offset = -50;
  #       };
  #     };
  #   };
  # };

  # environment.etc."lact/config.yaml" = {
  #   mode = "0644";
  #   text = lib.mkForce (
  #     lib.pipe config.services.lact.settings [
  #       ((pkgs.formats.yaml { }).generate "lact.yaml")
  #       builtins.readFile
  #       (builtins.split "'([0-9]+)':")
  #       (map (part: if builtins.isList part then "${builtins.head part}:" else part))
  #       (builtins.concatStringsSep "")
  #     ]
  #   );
  # };
}
