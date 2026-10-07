{ ... }: {
  zramSwap = {
    algorithm = "zstd";
    enable = true;
    memoryPercent = 25;
  };
}
