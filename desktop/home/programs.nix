{ load, ... }: {
  imports = [
    ./programs/firefox.nix
    ./programs/nushell.nix
    ./programs/ssh.nix
    ./programs/starship.nix
    ./programs/vscode.nix
  ];
  programs = {
    git = {
      enable = true;
    };
    gnome-terminal = {
      enable = true;
      profile = {
        "88888888-8888-8888-8888-888888888888" = {
          default = true;
          visibleName = "Default";
        };
      };
    };
    mangohud = {
      enable = true;
    };
  };
}
