{ inputs, pkgs, ... }: {
  programs = {
    command-not-found = {
      enable = false;
    };
    dconf = {
      enable = true;
    };
    gamemode = {
      enable = false;
      settings = {
        general = {
          softrealtime = "auto";
          renice = 10;
        };
        cpu = {
          apply_governor = "performance";
        };
      };
    };
    gamescope = {
      enable = true;
      capSysNice = true;
    };
    nushell = {
      enable = true;
    };
    seahorse = {
      enable = true;
    };
    steam = {
      enable = true;
      gamescopeSession = {
        enable = true;
      };
      extraCompatPackages = [
        inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.proton-cachyos_x86_64_v3
        inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.proton-ge-custom
      ];
    };
    xwayland = {
      enable = true;
    };
  };
}
