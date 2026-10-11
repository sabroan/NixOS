{ inputs, pkgs, ... }: {
  home = {
    packages = [
      inputs.amethyst-mod-manager.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
    persistence = {
      "/nix/state/home" = {
        directories = [
          {
            directory = ".config/AmethystModManager";
            mode = "0700";
          }
        ];
      };
    };
  };
}
