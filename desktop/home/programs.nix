{ ... }: {
  imports = [
    ./programs/firefox.nix
    ./programs/nushell.nix
    ./programs/obs-studio.nix
    ./programs/starship.nix
    ./programs/vscode.nix
  ];
  programs = {
    git = {
      enable = true;
    };
    mangohud = {
      enable = true;
    };
  };
}
