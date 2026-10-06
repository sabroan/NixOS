{
  config,
  lib,
  pkgs,
  ...
}:
{
  services.lact = {
    enable = true;
    settings = {
      daemon = {
        log_level = "info";
        admin_group = "wheel";
      };
      gpus = {
        "1002:747E-1002:0E37-0000:03:00.0" = {
          fan_control_enabled = true;
          fan_control_settings = {
            mode = "curve";
            temperature_key = "mem";
            interval_ms = 2500;
            curve = {
              "50" = 0.20;
              "60" = 0.25;
              "70" = 0.50;
              "80" = 0.75;
              "90" = 1.0;
            };
          };
          pmfw_options = {
            zero_rpm = false;
          };
          power_cap = 190.0;
          voltage_offset = -50;
        };
      };
    };
  };

  environment.etc."lact/config.yaml" = {
    mode = "0644";
    text = lib.mkForce (
      lib.pipe config.services.lact.settings [
        ((pkgs.formats.yaml { }).generate "lact.yaml")
        builtins.readFile
        (builtins.split "'([0-9]+)':")
        (map (part: if builtins.isList part then "${builtins.head part}:" else part))
        (builtins.concatStringsSep "")
      ]
    );
  };
}
