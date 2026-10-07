{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    gtk = {
      enable = true;
    };
    sway = {
      enable = true;
    };
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };
}
