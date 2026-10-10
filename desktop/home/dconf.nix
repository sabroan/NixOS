{ pkgs, ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/settings-daemon/plugins/housekeeping" = {
        donation-reminder-enabled = false;
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        primary-color = "#000000";
        secondary-color = "#000000";
        picture-uri = "";
        picture-uri-dark = "";
      };
      "org/gnome/desktop/input-sources" = {
        per-window = true;
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        font-antialiasing = "rgba";
        font-hinting = "slight";
      };
      "org/gnome/desktop/notifications" = {
        show-in-lock-screen = false;
      };
      "org/gnome/desktop/privacy" = {
        disable-camera = true;
        recent-files-max-age = 0;
        remember-recent-files = false;
      };
      "org/gnome/desktop/screen-time-limits" = {
        history-enabled = false;
        daily-limit-enabled = false;
        grayscale = false;
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          osd-volume-number.extensionUuid
          primary-input-on-lockscreen.extensionUuid
        ];
      };
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    osd-volume-number
    primary-input-on-lockscreen
  ];
}
