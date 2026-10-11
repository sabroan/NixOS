{...}: {
  imports = [
    ./configuration/boot.nix
    ./configuration/console.nix
    ./configuration/documentation.nix
    ./configuration/environment.nix
    ./configuration/fonts.nix
    ./configuration/hardware.nix
    ./configuration/i18n.nix
    ./configuration/networking.nix
    ./configuration/nix.nix
    ./configuration/nixpkgs.nix
    ./configuration/powermanagement.nix
    ./configuration/programs.nix
    ./configuration/security.nix
    ./configuration/services.nix
    ./configuration/system.nix
    ./configuration/systemd.nix
    ./configuration/time.nix
    ./configuration/users.nix
    ./configuration/virtualisation.nix
    ./configuration/zram.nix
  ];
}