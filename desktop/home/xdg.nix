{ pkgs, ... }: {
  xdg = {
    autostart = {
      enable = false;
      readOnly = true;
    };
    mimeApps = {
      enable = true;
      defaultApplications = {
        "x-scheme-handler/http" = "zen-beta.desktop";
        "x-scheme-handler/https" = "zen-beta.desktop";
      };
    };
    portal = {
      enable = true;
      extraPortals = [
        pkgs.xdg-desktop-portal-gtk
        pkgs.xdg-desktop-portal-wlr
      ];
      config = {
        common = {
          default = [
            "wlr"
            "gtk"
          ];
        };
        sway = {
          default = [
            "wlr"
            "gtk"
          ];
          "org.freedesktop.impl.portal.ScreenCast" = [
            "wlr"
          ];
          "org.freedesktop.impl.portal.Screenshot" = [
            "wlr"
          ];
        };
      };
    };
  };

  home.packages = with pkgs; [
    xdg-utils
  ];
}
