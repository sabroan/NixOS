{ pkgs, lib, ... }: {
  # https://orioninsist.org/blog/optimized-foot-config-for-sway-wayland/
  programs.foot = {
    enable = true;
    server = {
      enable = true;
    };
    settings = {
      main = {
        app-id = "footclient";
        pad = "8x8";
        resize-by-cells = "no";
        shell = lib.getExe pkgs.nushell;
        term = "xterm-256color";
        font = "monospace:size=12";
      };
      cursor = {
        style = "beam";
        beam-thickness = 1;
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "no";
      };
      colors-dark = {
        background = "2d2d2d";
        foreground = "cccccc";
      };
    };
  };

  home.sessionVariables = {
    TERMINAL = lib.getExe' pkgs.foot "footclient";
  };
}
