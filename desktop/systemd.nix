{ load, ... }: {
  imports = load.children ./systemd;
  systemd = {
    oomd = {
      enable = false;
    };
  };
}
