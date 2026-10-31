{ pkgs, ... }: {
  gtk = {
    enable = true;
    colorScheme = "dark";
    gtk4 = {
      enable = true;
    };
    theme = {
      name = "adw-gtk3-dark";
      package = pkgs.adw-gtk3;
    };
  };
}
