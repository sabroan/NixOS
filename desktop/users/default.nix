{
  config,
  load,
  pkgs,
  ...
}:
let
  username = "default";
in
{
  users.users.${username} = {
    description = "User";
    extraGroups = [
      "gamemode"
      "wheel"
    ];
    hashedPasswordFile = "/nix/state/root/etc/secrets/${username}/password.psk";
    isNormalUser = true;
    shell = pkgs.nushell;
  };

  home-manager.users.${username} = {
    imports = load.children ../home;
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
              directory = ".local/share/Steam";
              mode = "0700";
            }
            {
              directory = ".local/share/TelegramDesktop";
              mode = "0700";
            }
            {
              directory = ".config/zen/default/chrome";
              mode = "0700";
            }
          ];
          files = [
            ".config/zen/default/zen-themes.json"
          ];
        };
      };
      stateVersion = config.system.stateVersion;
    };
  };
}
