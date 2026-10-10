{ ... }: {
  services = {
    polkit-gnome = {
      enable = true;
    };
    udiskie = {
      enable = true;
    };
  };
}
