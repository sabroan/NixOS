{ ... }: {
  services.pulseaudio = {
    enable = false;
  };
  services.pipewire = {
    enable = true;
    alsa = {
      enable = true;
      support32Bit = true;
    };
    extraConfig = {
      pipewire = {
        "92-low-latency" = {
          "context.properties" = {
            "default.clock.max-quantum" = 512;
            "default.clock.min-quantum" = 32;
            "default.clock.quantum" = 128;
            "default.clock.rate" = 48000;
          };
        };
      };
    };
    jack = {
      enable = false;
    };
    pulse = {
      enable = true;
    };
    wireplumber = {
      enable = true;
      extraConfig = {
        "99-lower-microphone-priority" = {
          "monitor.alsa.rules" = [
            {
              matches = [
                { "node.name" = "alsa_output.usb-FIFINE_683_Microphone_FIFINE_683_Microphone-00.analog-stereo"; }
              ];
              actions = {
                update-props = {
                  "priority.driver" = 1;
                  "priority.session" = 1;
                };
              };
            }
          ];
        };
      };
    };
  };
}
