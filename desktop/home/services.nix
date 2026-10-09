{ ... }: {
  services = {
    gnome-keyring = {
      enable = true;
    };
    polkit-gnome = {
      enable = true;
    };
    ssh-agent = {
      enable = true;
    };
    udiskie = {
      enable = true;
    };
  };
}
