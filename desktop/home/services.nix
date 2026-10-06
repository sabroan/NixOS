{ ... }: {
  services = {
    ssh-agent = {
      enable = true;
    };
    udiskie = {
      enable = true;
    };
  };
}
