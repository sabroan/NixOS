{ ... }: {
  networking = {
    enableIPv6 = false;
    hostName = "desktop";
    networkmanager = {
      enable = false;
    };
    useDHCP = true;
    useNetworkd = true;
    wireless = {
      enable = false;
      iwd = {
        enable = true;
        settings = {
          IPv6 = {
            Enabled = false;
          };
          Settings = {
            AutoConnect = true;
          };
          Rank = {
            BandModifier = true;
          };
        };
      };
    };
  };
}
