{ config, pkgs, ... }: {
  users.users.default = {
    description = "User";
    extraGroups = [
      "gamemode"
      "networkmanager"
      "wheel"
    ];
    hashedPasswordFile = "/nix/state/root/etc/secrets/default/password.psk";
    isNormalUser = true;
    shell = pkgs.nushell;
  };

  home-manager.users.default = {
    imports = [
      ../home/dconf.nix
      ../home/gtk.nix
      ../home/pointer-cursor.nix
      ../home/programs.nix
      ../home/qt.nix
      ../home/services.nix
      ../home/systemd.nix
      ../home/xdg.nix
    ];
    home = {
      packages = with pkgs; [
        openmw
        telegram-desktop
      ];
      persistence = {
        "/nix/state/home" = {
          directories = [
            {
              directory = ".ssh";
              mode = "0700";
            }
            {
              directory = ".steam";
              mode = "0700";
            }
            {
              directory = ".local/share/keyrings";
              mode = "0700";
            }
            {
              directory = ".local/share/Steam";
              mode = "0700";
            }
            {
              directory = ".local/share/TelegramDesktop";
              mode = "0700";
            }
            {
              directory = ".config/Code/User/globalStorage/bmewburn.vscode-intelephense-client";
              mode = "0700";
            }
          ];
        };
      };
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
      };
      stateVersion = config.system.stateVersion;
    };
  };
}
