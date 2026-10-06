{ ... }: {
  programs.gamemode = {
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
}
