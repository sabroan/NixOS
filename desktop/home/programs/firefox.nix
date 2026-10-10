{ ... }: {
  programs.firefox = {
    enable = true;
    policies = {
      # https://firefox-admin-docs.mozilla.org/reference/policies/
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      BlockAboutAddons = true;
      BlockAboutProfiles = true;
      ClearOnShutdown = true;
      ContentAnalysisTelemetry = {
        Enabled = false;
        UrlLogging = "none";
      };
      DisableAccounts = true;
      DisableAppUpdate = true;
      DisableFeedbackCommands = true;
      DisableFirefoxAccounts = true;
      DisableFirefoxStudies = true;
      DisableFormHistory = true;
      DisableMasterPasswordCreation = true;
      DisableProfileImport = true;
      DisableRemoteImprovements = true;
      DisableSetDesktopBackground = true;
      DisableSystemAddonUpdate = true;
      DisableTelemetry = true;
      DontCheckDefaultBrowser = true;
      EnableTrackingProtection = {
        Category = "strict";
        Cryptomining = true;
        EmailTracking = true;
        Fingerprinting = true;
        Locked = true;
        SuspectedFingerprinting = true;
        Value = true;
      };
      EncryptedMediaExtensions = {
        Enabled = true;
        Locked = true;
      };
      ExtensionSettings = {
        "uBlock0@raymondhill.net" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/ublock-origin/latest.xpi";
          installation_mode = "force_installed";
          default_area = "menupanel";
        };
        "twitch5-fork@traumvogel" = {
          install_url = "https://addons.mozilla.org/firefox/downloads/latest/alternate-player-for-twitch/latest.xpi";
          installation_mode = "force_installed";
        };
      };
      FirefoxHome = {
        Highlights = false;
        Locked = true;
        Pocket = false;
        Search = true;
        Snippets = false;
        SponsoredPocket = false;
        SponsoredStories = false;
        SponsoredTopSites = false;
        Stories = false;
        TopSites = false;
        Widgets = {
          Enabled = false;
        };
      };
      FirefoxSuggest = {
        ImproveSuggest = false;
        Locked = true;
        SponsoredSuggestions = false;
        WebSuggestions = false;
      };
      HardwareAcceleration = true;
      Homepage = {
        Locked = true;
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
      Preferences = {
        "browser.cache.disk.enable" = false;
        "browser.newtab.preload" = false;
        "browser.sessionstore.privacy_level" = 2;
        "browser.sessionstore.resume_from_crash" = false;
        "browser.tabs.unloadOnLowMemory" = true;
        "browser.theme.native-theme" = false;
        "browser.translations.automaticallyPopup" = false;
        "devtools.command-button-measure.enabled" = true;
        "devtools.command-button-rulers.enabled" = true;
        "devtools.theme" = "dark";
        "devtools.toolbox.host" = "right";
        "media.webspeech.recognition.enable" = false;
        "media.webspeech.recognition.install_on_start" = false;
        "media.webspeech.synth.dont_notify_on_error" = true;
        "media.webspeech.synth.enabled" = false;
        "ui.systemUsesDarkTheme" = 1;
      };
      PrintingEnabled = false;
      PromptForDownloadLocation = true;
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
      UseSystemPrintDialog = false;
      XSLTEnabled = false;
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
      ".config/mozilla/firefox/default/browser-extension-data/twitch5-fork@traumvogel/storage.js" = {
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
