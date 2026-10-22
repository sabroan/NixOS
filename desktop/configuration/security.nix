{ ... }: {
  security = {
    pam = {
      services = {
        gdm = {
          enableGnomeKeyring = true;
        };
        login = {
          enableGnomeKeyring = true;
        };
      };
    };
  };
}
