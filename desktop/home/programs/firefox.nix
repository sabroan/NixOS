{ ... }: {
  programs.firefoxpwa = {
    enable = true;
  };
  programs.firefox = {
    enable = true;
    policies = {
      # https://mozilla.github.io/policy-templates/
      BlockAboutAddons = true;
      BlockAboutProfiles = true;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisablePocket = true;
      DisableProfileImport = true;
      DisableRemoteImprovements = true;
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Category = "strict";
        Cryptomining = true;
        Fingerprinting = true;
        EmailTracking = true;
      };
      EncryptedMediaExtensions = {
        Enabled = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
        };
        "twitch5-fork@traumvogel" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/alternate-player-for-twitch/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      HardwareAcceleration = true;
      Homepage = {
        StartPage = "none";
      };
      ManualAppUpdateOnly = true;
      NoDefaultBookmarks = true;
      OfferToSaveLogins = false;
      OverrideFirstRunPage = "";
      OverridePostUpdatePage = "";
      PasswordManagerEnabled = false;
      Permissions = {
        Camera = {
          BlockNewRequests = true;
          Locked = true;
        };
        Microphone = {
          BlockNewRequests = false;
          Locked = false;
        };
        Location = {
          BlockNewRequests = true;
          Locked = true;
        };
        Notifications = {
          BlockNewRequests = true;
          Locked = false;
        };
        Autoplay = {
          BlockNewRequests = true;
          Locked = true;
          Default = "block-audio-video";
        };
        VirtualReality = {
          BlockNewRequests = true;
          Locked = true;
        };
        ScreenShare = {
          Bloctrueequests = false;
          Locked = false;
        };
      };
      PictureInPicture = {
        Enabled = true;
        Locked = true;
      };
      PopupBlocking = {
        Default = true;
        Locked = false;
      };
      # https://mozilla.github.io/policy-templates/#preferences
      # https://searchfox.org/firefox-main/source/modules/libpref/init/StaticPrefList.yaml
      Preferences = {
        "browser.cache.disk.enable" = false;
        "browser.cache.memory.capacity" = 65536;
        "browser.newtab.preload" = false;
        "browser.sessionstore.interval" = 86400000;
        "browser.sessionstore.max_tabs_undo" = 2;
        "browser.sessionstore.privacy_level" = 2;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.tabs.unloadOnLowMemory" = true;
        "browser.translations.automaticallyPopup" = false;
        "browser.urlbar.suggest.bookmark" = false;
        "browser.urlbar.suggest.clipboard" = false;
        "browser.urlbar.suggest.engines" = false;
        "browser.urlbar.suggest.history" = false;
        "browser.urlbar.suggest.openpage" = false;
        "browser.urlbar.suggest.quickactions" = false;
        "browser.urlbar.suggest.recentsearches" = false;
        "browser.urlbar.suggest.semanticHistory.minLength" = 0;
        "browser.urlbar.suggest.topsites" = false;
        "devtools.command-button-measure.enabled" = true;
        "devtools.command-button-rulers.enabled" = true;
        "devtools.theme" = "dark";
        "devtools.toolbox.host" = "right";
        "dom.ipc.processCount" = 4;
        "extensions.formautofill.creditCards.enabled" = false;
        "media.webspeech.recognition.enable" = false;
        "media.webspeech.synth.dont_notify_on_error" = true;
        "media.webspeech.synth.enabled" = false;
        "ui.systemUsesDarkTheme" = 1;
        "widget.gtk.rounded-bottom-corners.enabled" = false;
      };
      PromptForDownloadLocation = true;
      SanitizeOnShutdown = true;
      SearchEngines = {
        Default = "DuckDuckGo";
        PreventInstalls = true;
        Remove = [
          "Amazon.com"
          "Bing"
          "eBay"
          "Perplexity"
          "Wikipedia (en)"
        ];
      };
      SearchSuggestEnabled = false;
      ShowHomeButton = false;
      UserMessaging = {
        ExtensionRecommendations = false;
        FeatureRecommendations = false;
        UrlbarInterventions = false;
        SkipOnboarding = true;
        MoreFromMozilla = false;
        FirefoxLabs = false;
        Locked = true;
      };
    };
    profiles = {
      default = {
        extensions = {
          force = true;
          settings = {
            "uBlock0@raymondhill.net" = {
              force = true;
              settings = {
                showIconBadge = false;
                tooltipsDisabled = true;
                webrtcIPAddressHidden = true;
                selectedFilterLists = [
                  "adguard-cookies"
                  "adguard-generic"
                  "adguard-mobile-app-banners"
                  "adguard-mobile"
                  "adguard-other-annoyances"
                  "adguard-popup-overlays"
                  "adguard-social"
                  "adguard-spyware-url"
                  "adguard-widgets"
                  "block-lan"
                  "curben-phishing"
                  "dpollock-0"
                  "easylist-annoyances"
                  "easylist-chat"
                  "easylist-newsletters"
                  "easylist-notifications"
                  "easylist"
                  "easyprivacy"
                  "fanboy-ai-suggestions"
                  "fanboy-cookiemonster"
                  "fanboy-social"
                  "fanboy-thirdparty_social"
                  "plowe-0"
                  "RUS-0"
                  "RUS-1"
                  "ublock-annoyances"
                  "ublock-badlists"
                  "ublock-badware"
                  "ublock-cookies-adguard"
                  "ublock-cookies-easylist"
                  "ublock-experimental"
                  "ublock-filters"
                  "ublock-privacy"
                  "ublock-quick-fixes"
                  "ublock-unbreak"
                  "UKR-0"
                  "urlhaus-1"
                  "user-filters"
                ];
              };
            };
          };
        };
      };
    };
  };

  home = {
    file = {
      ".config/firefox/default/browser-extension-data/twitch5-fork@traumvogel/storage.js" = {
        force = true;
        text = builtins.toJSON {
          auto-redirect-seen = true;
          buffer-preset-selected = "J0128";
          chat-state = 0;
          closed-chat-state = 0;
          muted = false;
          random-seed = 0.0000000000000000;
          settings-version = 2;
          theme-preset-selected = "J0125";
          volume = 100;
          follow-sidebar-recommended-enabled = false;
        };
      };
    };
  };
}
