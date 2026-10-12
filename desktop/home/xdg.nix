{ pkgs, ... }: {
  xdg = {
    portal = {
      config = {
        common = {
          default = [
            "gnome"
          ];
        };
      };
      enable = true;
      extraPortals = with pkgs; [
        xdg-desktop-portal-gnome
      ];
      xdgOpenUsePortal = true;
    };
  };
  home = {
    packages = with pkgs; [
      xdg-utils
    ];
  };
}
