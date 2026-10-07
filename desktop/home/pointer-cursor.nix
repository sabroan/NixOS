{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    gtk = {
      enable = true;
    };
    sway = {
      enable = true;
    };
    x11 = {
      enable = true;
    };
    # package = pkgs.numix-cursor-theme;
    # name = "Numix-Cursor";
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };
}
