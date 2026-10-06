{ ... }: {
  systemd.coredump = {
    enable = true;
    settings = {
      Coredump = {
        MaxUse = "64M";
        ProcessSizeMax = "64M";
      };
    };
  };
}
