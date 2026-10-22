{ pkgs, ... }: {
  environment.systemPackages = with pkgs; [
    podman-compose
    podman-desktop
  ];
  virtualisation = {
    containers = {
      registries = {
        settings = {
          "unqualified-search-registries" = [
            "docker.io"
          ];
        };
      };
    };
    podman = {
      enable = true;
      dockerCompat = true;
      defaultNetwork = {
        settings = {
          dns_enabled = true;
        };
      };
    };
  };
}
