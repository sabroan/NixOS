{ load, ... }: {
  imports = load.children ./programs;
  programs = {
    command-not-found = {
      enable = false;
    };
    dconf = {
      enable = true;
    };
    nushell = {
      enable = true;
    };
  };
}
