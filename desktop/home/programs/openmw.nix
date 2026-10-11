{ pkgs, ... }: {
  home = {
    packages = [ pkgs.openmw ];
    persistence = {
      "/nix/state/home" = {
        directories = [
          {
            directory = ".config/openmw";
            mode = "0700";
          }
          {
            directory = ".local/share/openmw";
            mode = "0700";
          }
        ];
      };
    };
  };
}
