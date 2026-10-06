{ ... }: {
  # https://www.nushell.sh/book/configuration.html
  programs.nushell = {
    enable = true;
    settings = {
      show_banner = false;
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

      nxupdate = "sudo nixos-rebuild switch --flake /nix/state/flake";
      nxpurge = "sudo nix-collect-garbage -d";
      tosleep = "systemctl suspend";
    };
  };

  home.sessionVariables = {
    CLICOLOR = "1";
  };
}
