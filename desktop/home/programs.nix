{ ... }: {
  imports = [
    ./programs/firefox.nix
    ./programs/nushell.nix
    ./programs/openmw.nix
    ./programs/starship.nix
    ./programs/telegram.nix
    ./programs/vscode.nix
  ];
  programs = {
    git = {
      enable = true;
    };
    mangohud = {
      enable = true;
    };
    obs-studio = {
      enable = true;
    };
  };
}
