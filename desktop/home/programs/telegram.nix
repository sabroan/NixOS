{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ telegram-desktop ];
    persistence = {
      "/nix/state/home" = {
        directories = [
          {
            directory = ".local/share/TelegramDesktop";
            mode = "0700";
          }
        ];
      };
    };
  };
}
