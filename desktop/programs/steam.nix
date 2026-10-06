{ inputs, pkgs, ... }: {
  programs.steam = {
    enable = true;
    gamescopeSession.enable = true;
    extraCompatPackages = [
      inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.proton-cachyos_x86_64_v3
      inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.proton-ge-custom
    ];
  };
}
