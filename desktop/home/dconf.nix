{ lib, pkgs, ... }:
let
  inherit (lib.hm.gvariant) mkDictionaryEntry mkVariant;
  shell = {
    app-picker-layout = {
      setPosition =
        name: position:
        mkDictionaryEntry [
          name
          (mkVariant [
            (mkDictionaryEntry [
              "position"
              (mkVariant position)
            ])
          ])
        ];
      to-layout = apps: [
        (lib.imap0 (index: app: shell.app-picker-layout.setPosition app index) apps)
      ];
    };
  };
in
{
  dconf = {
    enable = true;
    settings = {
      "org/gnome/Console" = {
        transparency = true;
      };
      "org/gnome/desktop/app-folders" = {
        folder-children = [
          "Internet"
          "Games"
          "System"
          "Utilities"
          "Software"
        ];
      };
      "org/gnome/desktop/app-folders/folders/Games" = {
        name = "Games";
        apps = [
          "steam.desktop"
        ];
      };
      "org/gnome/desktop/app-folders/folders/Internet" = {
        name = "Internet";
        apps = [
          "firefox.desktop"
          "org.telegram.desktop.desktop"
        ];
      };
      "org/gnome/desktop/app-folders/folders/System" = {
        name = "System";
        apps = [
          "org.gnome.Calendar.desktop"
          "org.gnome.Boxes.desktop"
          "org.gnome.Extensions.desktop"
          "org.gnome.World.Secrets.desktop"
          "org.gnome.Logs.desktop"
          "org.gnome.Settings.desktop"
          "org.gnome.SystemMonitor.desktop"
          "io.github.ilya_zlobintsev.LACT.desktop"
        ];
      };
      "org/gnome/desktop/app-folders/folders/Utilities" = {
        name = "Utilities";
        apps = [
          "org.gnome.Papers.desktop"
          "com.github.finefindus.eyedropper.desktop"
          "de.haeckerfelix.Fragments.desktop"
          "org.gnome.Loupe.desktop"
          "org.gnome.TextEditor.desktop"
          "org.gnome.Showtime.desktop"
          "code.desktop"
        ];
      };
      "org/gnome/desktop/app-folders/folders/Software" = {
        name = "Software";
        apps = [
          "podman-desktop.desktop"
        ];
      };
      "org/gnome/desktop/background" = {
        color-shading-type = "solid";
        primary-color = "#000000";
        secondary-color = "#000000";
        picture-uri = "none";
        picture-uri-dark = "none";
      };
      "org/gnome/desktop/datetime" = {
        automatic-timezone = true;
      };
      "org/gnome/desktop/input-sources" = {
        per-window = true;
        sources = [
          (lib.hm.gvariant.mkTuple [
            "xkb"
            "us"
          ])
          (lib.hm.gvariant.mkTuple [
            "xkb"
            "ua"
          ])
        ];
      };
      "org/gnome/desktop/interface" = {
        clock-show-seconds = false;
        clock-show-weekday = true;
        color-scheme = "prefer-dark";
        font-antialiasing = "rgba";
        font-hinting = "slight";
      };
      "org/gnome/desktop/notifications" = {
        show-in-lock-screen = false;
      };
      "org/gnome/desktop/notifications/application/org-gnome-console" = {
        enable = false;
        show-banners = false;
        show-in-lock-screen = false;
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
      "org/gnome/gnome-system-monitor" = {
        show-dependencies = true;
      };
      "org/gnome/mutter" = {
        edge-tiling = true;
      };
      "org/gnome/TextEditor" = {
        discover-settings = false;
        highlight-current-line = true;
        indent-style = "space";
        indent-width = 4;
        restore-session = false;
        show-line-numbers = true;
        tab-width = 4;
      };
      "org/gnome/settings-daemon/plugins/housekeeping" = {
        donation-reminder-enabled = false;
      };
      "org/gnome/shell" = {
        app-picker-layout = shell.app-picker-layout.to-layout [
          "Internet"
          "Games"
          "Software"
          "System"
          "Utilities"
        ];
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          appindicator.extensionUuid
          osd-volume-number.extensionUuid
          primary-input-on-lockscreen.extensionUuid
        ];
        favorite-apps = [
          "org.gnome.Nautilus.desktop"
          "org.gnome.Console.desktop"
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
