{ ... }: {
  systemd.network = {
    networks = {
      "10-wireless" = {
        matchConfig = {
          Name = "wl*";
        };
        networkConfig = {
          DHCP = "ipv4";
        };
      };
    };
  };
}
