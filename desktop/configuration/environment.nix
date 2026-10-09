{ pkgs, ... }: {
  environment = {
    defaultPackages = [ ];
    gnome = {
      excludePackages = with pkgs; [
        gnome-tour
      ];
    };
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
          directory = "/etc/NetworkManager/system-connections";
          user = "root";
          group = "root";
          mode = "0700";
        }
        {
          directory = "/etc/nixos";
          user = "root";
          group = "root";
          mode = "0744";
        }
        {
          directory = "/var/lib/nixos";
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
    systemPackages = with pkgs; [
      gnome-autoar
      gnome-console
      gnome-system-monitor
      nautilus
    ];
    variables = {
      HSA_OVERRIDE_GFX_VERSION = "11.0.0";
    };
  };
}
