{
  config,
  lib,
  pkgs,
  ...
}:
let
  modifier = "Mod4";
  menu = "${lib.getExe' pkgs.tofi "tofi-drun"} --prompt-text ''";
  swaymsg = lib.getExe' pkgs.sway "swaymsg";
  terminal = lib.getExe' pkgs.foot "footclient";
  grimshot = lib.getExe pkgs.sway-contrib.grimshot;

  screenshot = {
    screen = "${grimshot} copy screen";
    window = "${grimshot} copy active";
    area = "${grimshot} copy area";
    # area = ''
    #   ${lib.getExe pkgs.slurp} ${
    #     lib.escapeShellArgs [
    #       "-b"
    #       "#2d2d2df2"
    #       "-s"
    #       "#cccccc00"
    #       "-c"
    #       "#393939"
    #       "-w"
    #       "2"
    #     ]
    #   } | ${lib.getExe pkgs.grim} -g - - | ${lib.getExe' pkgs.wl-clipboard "wl-copy"}
    # '';
  };
  quake = {
    id = {
      bg = "quake-background";
      one = "quake-one-time";
    };

    position = "move position 0 0";
    size = "resize set width 100 ppt height 20 ppt";
    style = "floating enable, sticky enable, border none, opacity 0.98";

    command = "${quake.style}, ${quake.size}, ${quake.position}";
  };
in
{
  wayland.windowManager.sway = {
    enable = true;
    checkConfig = true;
    config = {
      startup = [
        { command = lib.getExe pkgs.swaykbdd; }
        { command = ''${lib.getExe' pkgs.coreutils "sleep"} 2 && ${terminal} --app-id="${quake.id.bg}"''; }
      ];
      terminal = terminal;
      menu = menu;
      modifier = modifier;
      bindkeysToCode = true;
      keybindings = lib.mkOptionDefault {
        "${modifier}+b" = "exec ${lib.getExe config.programs.zen-browser.package}";
        "${modifier}+d" = "exec ${menu} | ${lib.getExe' pkgs.findutils "xargs"} ${swaymsg} exec --";
        "${modifier}+e" = "exec ${terminal} ${lib.getExe pkgs.yazi}";
        "${modifier}+t" = "exec ${terminal} ${lib.getExe config.programs.helix.package}";
        "${modifier}+c" = "exec ${terminal} ${lib.getExe pkgs.numr}";
        "Print" = "exec ${screenshot.area}";
        "Print+Ctrl" = "exec ${screenshot.window}";
        "Print+Shift" = "exec ${screenshot.screen}";
        "${modifier}+grave" =
          ''exec ${swaymsg} '[app_id="${quake.id.bg}"] scratchpad show, ${quake.size}, ${quake.position}';'';
        "${modifier}+Shift+grave" =
          ''exec ${swaymsg} '[app_id="${quake.id.one}"] kill' || ${terminal} --app-id="${quake.id.one}"'';
      };
      assigns = {
        "9: Games" = [
          { class = "^steam"; }
        ];
      };
      window = {
        titlebar = false;
        border = 1;
        hideEdgeBorders = "smart_no_gaps";
        commands = [
          {
            command = "${quake.command}, move scratchpad";
            criteria = {
              app_id = quake.id.bg;
            };
          }
          {
            command = quake.command;
            criteria = {
              app_id = quake.id.one;
            };
          }
        ];
      };
      gaps = {
        inner = 0;
        outer = 0;
        smartGaps = "on";
      };
      floating = {
        titlebar = false;
        border = 0;
        modifier = "Shift";
        criteria = [
          { app_id = "telegram"; }
          { title = "Picture-in-Picture"; }
        ];
      };
      focus = {
        followMouse = false;
      };
      bars = [
        {
          id = "main";
          position = "bottom";
          command = lib.getExe' pkgs.sway "swaybar";
          trayOutput = "*";
          fonts = {
            names = [ "monospace" ];
            size = 12.0;
          };
          trayPadding = 6;
          statusCommand = "${lib.getExe pkgs.i3status-rust} ${config.xdg.configHome}/i3status-rust/config-default.toml";
          colors = {
            background = "#2d2d2d";
            statusline = "#cccccc";
            separator = "#393939";
            focusedWorkspace = {
              background = "#393939";
              border = "#6699cc";
              text = "#cccccc";
            };
            activeWorkspace = {
              background = "#2d2d2d";
              border = "#515151";
              text = "#cccccc";
            };
            inactiveWorkspace = {
              background = "#2d2d2d";
              border = "#2d2d2d";
              text = "#999999";
            };
            urgentWorkspace = {
              background = "#f2777a";
              border = "#f2777a";
              text = "#2d2d2d";
            };
          };
        }
      ];
      colors = {
        background = "#2d2d2d";
        focused = {
          border = "#6699cc";
          background = "#6699cc";
          text = "#2d2d2d";
          indicator = "#66cccc";
          childBorder = "#666666"; # "#6699cc";
        };
        focusedInactive = {
          border = "#393939";
          background = "#393939";
          text = "#cccccc";
          indicator = "#515151";
          childBorder = "#393939";
        };
        unfocused = {
          border = "#2d2d2d";
          background = "#2d2d2d";
          text = "#999999";
          indicator = "#2d2d2d";
          childBorder = "#2d2d2d"; # "#515151";
        };
        urgent = {
          border = "#f2777a";
          background = "#f2777a";
          text = "#2d2d2d";
          indicator = "#f99157";
          childBorder = "#f2777a";
        };
        placeholder = {
          border = "#2d2d2d";
          background = "#2d2d2d";
          text = "#999999";
          indicator = "#2d2d2d";
          childBorder = "#2d2d2d";
        };
      };
      input = {
        "type:keyboard" = {
          xkb_layout = "us,ua";
          xkb_options = "grp:caps_toggle,caps:none";
        };
      };
    };
    systemd = {
      enable = true;
      variables = [ "--all" ];
    };
    wrapperFeatures.gtk = true;
  };

  programs.nushell.loginFile.text = ''
    if ($env.WAYLAND_DISPLAY? | is-empty) and ((tty | str trim) == "/dev/tty1") {
      with-env {
        GDK_PIXBUF_MODULE_FILE: "${pkgs.librsvg}/lib/gdk-pixbuf-2.0/2.10.0/loaders.cache"
      } {
        exec ${lib.getExe pkgs.sway}
      }
    }
  '';

  services.swayidle = {
    enable = true;
    timeouts =
      let
        swaymsg = lib.getExe' pkgs.sway "swaymsg";
        systemctl = lib.getExe' pkgs.systemd "systemctl";
      in
      [
        {
          timeout = 300;
          command = "${swaymsg} 'output * dpms off'";
          resumeCommand = "${swaymsg} 'output * dpms on'";
        }
        {
          timeout = 900;
          command = "${systemctl} suspend";
        }
      ];
  };
  home = {
    packages = with pkgs; [
      numr
      sway-contrib.grimshot
      wl-clipboard
    ];
    sessionVariables = {
      CLUTTER_BACKEND = "wayland";
      GDK_BACKEND = "wayland,x11,*";
      NIXOS_OZONE_WL = "1";
      QT_QPA_PLATFORM = "wayland;xcb";
      SDL_VIDEODRIVER = "wayland,x11,windows";
    };
  };
}
