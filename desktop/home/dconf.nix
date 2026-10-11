{ lib, pkgs, ... }: {
  dconf = {
    enable = true;
    settings = {
      "org/gnome/Console" = {
        transparency = true;
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        primary-color = "#000000";
        secondary-color = "#000000";
        picture-uri = "none";
        picture-uri-dark = "none";
      };
      "org/gnome/desktop/input-sources" = {
        per-window = true;
        sources = [
          (lib.hm.gvariant.mkTuple [ "xkb" "us" ])
          (lib.hm.gvariant.mkTuple [ "xkb" "ua" ])
        ];
      };
      "org/gnome/desktop/interface" = {
        color-scheme = "prefer-dark";
        font-antialiasing = "rgba";
        font-hinting = "slight";
      };
      "org/gnome/desktop/notifications" = {
        show-in-lock-screen = false;
      };
      "org/gnome/desktop/notifications/application/org-gnome-console" = {
        enable = false;
      };
      "org/gnome/desktop/privacy" = {
        disable-camera = true;
        hide-identity = true;
        old-files-age = 0;
        recent-files-max-age = 0;
        remember-app-usage = false;
        remember-recent-files = false;
        remove-old-temp-files = true;
        remove-old-trash-files = true;
        report-technical-problems = false;
        send-software-usage-stats = false;
        usb-protection = true;
      };
      "org/gnome/desktop/screen-time-limits" = {
        history-enabled = false;
        daily-limit-enabled = false;
        grayscale = false;
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
      };
      "org/gnome/TextEditor" = {
        highlight-current-line = true;
        indent-style = "space";
        show-line-numbers = true;
        tab-width = 4;
      };
      "org/gnome/settings-daemon/plugins/housekeeping" = {
        donation-reminder-enabled = false;
      };
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          osd-volume-number.extensionUuid
          primary-input-on-lockscreen.extensionUuid
        ];
        favorite-apps = [];
      };
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    appindicator
    osd-volume-number
    primary-input-on-lockscreen
  ];
}
