{ ... }: {
  programs.obs-studio = {
    enable = true;
  };
  home.persistence = {
    "/nix/state/home" = {
      directories = [
        {
          directory = ".config/obs-studio";
          mode = "0700";
        }
      ];
    };
  };
}
