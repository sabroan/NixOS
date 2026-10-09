{ pkgs, ... }: {
  xdg = {
    portal = {
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
        # xdg-desktop-portal-gtk
      ];
      config = {
        common = {
          default = [
            "gtk"
          ];
        };
      };
    };
  };
  home.packages = with pkgs; [
    xdg-utils
  ];
}
