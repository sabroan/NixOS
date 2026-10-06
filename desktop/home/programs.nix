{ load, ... }: {
  imports = load.children ./programs;
  programs = {
    git = {
      enable = true;
    };
    mangohud = {
      enable = true;
    };
  };
}
