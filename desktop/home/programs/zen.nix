{ inputs, ... }: {
  imports = [
    inputs.zen-browser.homeModules.beta
  ];

  programs.zen-browser = {
    enable = true;
    setAsDefaultBrowser = true;
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
        # https://github.com/zen-browser/desktop/blob/dev/prefs/zen/
        settings = {
          "startup.homepage_welcome_url.additional" = "";
          "zen.mods.AudioIndicatorEnhanced.audioWave.enabled" = true;
          "zen.tabs.show-newtab-vertical" = false;
          "zen.tabs.vertical.right-side" = false;
          "zen.theme.content-element-separation" = 0;
          "zen.theme.styled-status-panel" = true;
          "zen.updates.show-update-notification" = false;
          "zen.view.compact.enable-at-startup" = false;
          "zen.view.compact.hide-tabbar" = true;
          "zen.view.compact.hide-toolbar" = false;
          "zen.view.compact.show-background-tab-toast" = false;
          "zen.view.show-clear-tabs-button" = false;
          "zen.view.show-newtab-button-top" = false;
          "zen.view.use-single-toolbar" = false;
          "zen.view.window.scheme" = 0;
          "zen.welcome-screen.seen" = true;
          # "zen.window-sync.enabled" = false;
          # "zen.window-sync.prefer-unsynced-windows" = true;
        };
        # https://zen-browser.app/mods/{UUID}
        mods = [
          "f7c71d9a-bce2-420f-ae44-a64bd92975ab" # Better Unloaded Tabs
          "2317fd93-c3ed-4f37-b55a-304c1816819e" # Audio Indicator Enhanced
          "c8d9e6e6-e702-4e15-8972-3596e57cf398" # Zen Back Forward
        ];
      };
    };
  };

  home = {
    file = {
      ".config/zen/default/browser-extension-data/twitch5-fork@traumvogel/storage.js" = {
        force = true;
        text = builtins.toJSON {
          #auto-redirect-allowed = true;
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
