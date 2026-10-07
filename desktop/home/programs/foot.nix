{ ... }: {
  programs.foot = {
    enable = true;
    server = {
      enable = true;
    };
    settings = {
      main = {
        pad = "8x8";
        font = "monospace:size=12";
        initial-color-theme = "dark";
      };
      colors-dark = {
        background = "2d2d2d";
        foreground = "cccccc";

        regular0 = "515151"; # Black
        regular1 = "f2777a"; # Red
        regular2 = "99cc99"; # Green
        regular3 = "ffcc66"; # Yellow
        regular4 = "6699cc"; # Blue
        regular5 = "cc99cc"; # Magenta
        regular6 = "66cccc"; # Cyan
        regular7 = "cccccc"; # White

        bright0 = "515151"; # Black
        bright1 = "f2777a"; # Red
        bright2 = "99cc99"; # Green
        bright3 = "ffcc66"; # Yellow
        bright4 = "6699cc"; # Blue
        bright5 = "cc99cc"; # Magenta
        bright6 = "66cccc"; # Cyan
        bright7 = "cccccc"; # White

        selection-foreground = "2d2d2d";
        selection-background = "cccccc";
        cursor = "2d2d2d cccccc";
      };
      cursor = {
        style = "beam";
        unfocused-style = "none";
        beam-thickness = 1;
      };
      mouse = {
        hide-when-typing = "yes";
        alternate-scroll-mode = "no";
      };
    };
  };
}
