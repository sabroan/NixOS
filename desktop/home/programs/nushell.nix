{ ... }: {
  programs.nushell = {
    enable = true;
    settings = {
      error_style = "short";
      show_banner = false;
      table = {
        mode = "none";
      };
      history = {
        max_size = 256;
        file_format = "sqlite";
        sync_on_enter = true;
        isolation = false;
        ignore_space_prefixed = true;
      };
    };
    shellAliases = {
      ".." = "cd ..";
      "~" = "cd ~";

      cp = "cp -i";
      mv = "mv -i";
      rm = "rm -i";

      nxupdate = "sudo nixos-rebuild switch --flake path:/etc/nixos";
      nxpurge = "sudo nix-collect-garbage -d";
      tosleep = "systemctl suspend";
    };
  };
}
