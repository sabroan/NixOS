{ lib, pkgs, ... }: {
  programs.i3status-rust = {
    enable = true;
    bars = {
      default = {
        theme = "tomorrow-night";
        icons = "material-nf";
        settings = {
          theme = {
            overrides = {
              idle_bg = "#2d2d2d";
              idle_fg = "#cccccc";
              good_bg = "#2d2d2d";
              good_fg = "#99cc99";
              warning_bg = "#2d2d2d";
              warning_fg = "#ffcc66";
              critical_bg = "#2d2d2d";
              critical_fg = "#f2777a";
              info_bg = "#2d2d2d";
              info_fg = "#cccccc";
              separator_bg = "#2d2d2d";
              separator_fg = "#515151";
              start_separator = "";
              end_separator = "|";
            };
          };
        };
        blocks = [
          {
            block = "music";
            format = "{ $prev $play $next $combo.str(max_w:25,rot_interval:1) |}";
          }
          {
            block = "disk_space";
            path = "/";
            interval = 60;
            alert = 10.0;
            warning = 20.0;
            info_type = "used";
            format = "{ $icon $path $percentage.eng(w:2,pad_with:'',range:50..) |}";
            format_alt = "{ $icon $path $used.eng(w:4,pad_with:'') $total.eng(w:4,pad_with:'') }";
          }
          {
            block = "disk_space";
            path = "/nix";
            interval = 60;
            alert = 10.0;
            warning = 20.0;
            info_type = "used";
            format = "{ $icon $path $percentage.eng(w:2,pad_with:'',range:50..) |}";
            format_alt = "{ $icon $path $used.eng(w:4,pad_with:'') $total.eng(w:4,pad_with:'') }";
          }
          {
            block = "disk_space";
            path = "/data";
            interval = 60;
            alert = 10.0;
            warning = 20.0;
            info_type = "used";
            format = "{ $icon $path $percentage.eng(w:2,pad_with:'',range:50..) |}";
            format_alt = "{ $icon $path $used.eng(w:4,pad_with:'') $total.eng(w:4,pad_with:'') }";
          }
          {
            block = "cpu";
            format = "{ $icon $utilization.eng(pad_with:'',range:25..) |}";
            format_alt = " $icon $barchart ";
            interval = 2;
            warning_cpu = 75;
            critical_cpu = 90;
          }
          {
            block = "temperature";
            format = "{ ^icon_cpu $icon $max.eng(pad_with:'',range:55..) |}";
            chip = "k10temp-pci-*";
            interval = 3;
            good = 50;
            idle = 60;
            info = 70;
            warning = 75;
          }
          {
            block = "memory";
            format = "{ $icon $mem_used_percents.eng(pad_with:'',range:20..) |}";
            format_alt = " $icon {$mem_used.eng(w:3,pad_with:'') / $mem_total.eng(w:4,pad_with:'')} ";
            interval = 5;
            warning_mem = 80;
            critical_mem = 95;
          }
          {
            block = "amd_gpu";
            device = "card1";
            format = "{ $icon $utilization.eng(pad_with:'',range:10..) |}";
            format_alt = " $icon  {$vram_used.eng(w:4,pad_with:'') / $vram_used_percents.eng(pad_with:'') / $vram_total.eng(pad_with:'')} ";
            interval = 5;
          }
          {
            block = "temperature";
            format = "{ ^icon_gpu $icon $max.eng(pad_with:'',range:65..) |}";
            chip = "amdgpu-*";
            interval = 3;
            good = 50;
            idle = 60;
            info = 70;
            warning = 75;
          }
          {
            block = "docker";
            interval = 30;
            format = "{ $icon $running.eng(w:2,pad_with:'',range:1..) |}";
            socket_path = "$XDG_RUNTIME_DIR/podman/podman.sock";
          }
          {
            block = "net";
            interval = 3;
            format = "{ $icon $signal_strength.eng(range:..50) |}";
            format_alt = " $icon {⇣$speed_down.eng(w:4,pad_with:'') / ⇡$speed_up.eng(w:4,pad_with:'')} ";
          }
          {
            block = "sound";
            device_kind = "source";
            format = " $icon {$volume.eng(w:2,pad_with:'') |}";
          }
          {
            block = "sound";
            device_kind = "sink";
            format = " $icon {$volume.eng(w:2,pad_with:'') |}";
            headphones_indicator = true;
          }
          {
            block = "keyboard_layout";
            driver = "sway";
            format = "{$layout.eng(pad_with:'')|}";
            mappings = {
              "English (US)" = "";
              "Ukrainian (N/A)" = " UA ";
            };
          }
          {
            block = "time";
            interval = 45;
            format = " $icon $timestamp.datetime(f:'%R') ";
          }
          {
            block = "scratchpad";
            format = "{ $icon $count.eng(pad_with:'',range:1..) |}";
            click = [
              {
                button = "left";
                cmd = "swaymsg scratchpad show";
              }
              {
                button = "right";
                cmd = "swaymsg move scratchpad";
              }
            ];
          }
          {
            block = "menu";
            text = "  ";
            items =
              let
                systemctl = lib.getExe' pkgs.systemd "systemctl";
              in
              [
                {
                  display = " 󰤄 ";
                  cmd = "${lib.getExe' pkgs.coreutils "sleep"} 1; ${systemctl} suspend";
                }
                {
                  display = " 󰚥 ";
                  cmd = "${systemctl} poweroff";
                }
              ];
          }
        ];
      };
    };
  };
}
