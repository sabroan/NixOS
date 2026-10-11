{ pkgs, ... }: {
  home.pointerCursor = {
    enable = true;
    gtk = {
      enable = true;
    };
    package = pkgs.phinger-cursors;
    name = "phinger-cursors-light";
  };
}
