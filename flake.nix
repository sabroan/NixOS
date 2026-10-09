{
  inputs = {
    nixpkgs = {
      url = "github:nixos/nixpkgs/nixos-unstable";
    };
    nixos-hardware = {
      url = "github:nixos/nixos-hardware/master";
    };
    nix-vscode-extensions = {
      url = "github:nix-community/nix-vscode-extensions";
    };
    chaotic = {
      url = "github:chaotic-cx/nyx/nyxpkgs-unstable";
    };
    disko = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/disko";
    };
    home-manager = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/home-manager";
    };
    impermanence = {
      inputs.nixpkgs.follows = "nixpkgs";
      url = "github:nix-community/impermanence";
    };
  };

  outputs =
    {
      chaotic,
      disko,
      home-manager,
      impermanence,
      nix-vscode-extensions,
      nixos-hardware,
      nixpkgs,
      self,
      ...
    }@inputs:
    {
      nixosConfigurations = {
        desktop = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs; };
          modules = [
            {
              nixpkgs.overlays = [
                nix-vscode-extensions.overlays.default
              ];
            }
            chaotic.nixosModules.default
            disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            {
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.extraSpecialArgs = { inherit inputs; };
            }
            nixos-hardware.nixosModules.common-cpu-amd
            nixos-hardware.nixosModules.common-cpu-amd-pstate
            nixos-hardware.nixosModules.common-gpu-amd
            nixos-hardware.nixosModules.common-pc-ssd
            impermanence.nixosModules.impermanence
          ] ++ [
            ./desktop/configuration.nix
            ./desktop/disko.nix
          ];
        };
      };
    };
}
