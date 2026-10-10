{ ... }: {
  security = {
    pam = {
      services = {
        login = {
          enableGnomeKeyring = true;
        };
      };
    };
    polkit = {
      enable = true;
    };
    rtkit = {
      enable = true;
    };
  };
}
