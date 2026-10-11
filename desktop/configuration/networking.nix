{ ... }: {
  networking = {
    enableIPv6 = false;
    hostName = "desktop";
    networkmanager = {
      enable = true;
    };
  };
}
