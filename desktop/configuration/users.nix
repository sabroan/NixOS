{ ... }: {
  imports = [
    ../users/default.nix
  ];
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword = "!";
      };
    };
  };
}
