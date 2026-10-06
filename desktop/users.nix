{ lib, load, ... }: {
  imports = load.children ./users;
  users = {
    mutableUsers = false;
    users = {
      root = {
        hashedPassword = "!";
      };
    };
  };
}
