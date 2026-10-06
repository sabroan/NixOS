{ ... }: {
  environment = {
    defaultPackages = [ ];
    pathsToLink = [
      "/share/applications"
      "/share/xdg-desktop-portal"
    ];
    persistence."/nix/state/root" = {
      hideMounts = true;
      directories = [
        {
          directory = "/etc/secrets";
          user = "root";
          group = "root";
          mode = "0700";
        }
        {
          directory = "/var/lib/iwd";
          user = "root";
          group = "root";
          mode = "0700";
        }
        {
          directory = "/var/lib/nixos";
          user = "root";
          group = "root";
          mode = "0755";
        }
        {
          directory = "/var/lib/systemd/coredump";
          user = "root";
          group = "root";
          mode = "0755";
        }
      ];
      files = [
        "/etc/machine-id"
      ];
    };
    sessionVariables = {
      AMD_VULKAN_ICD = "RADV";
    };
    variables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    };
  };
}
