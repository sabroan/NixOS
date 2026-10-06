{ ... }: {
  programs.ssh = {
    enable = true;
    enableDefaultConfig = false;
    settings = {
      "github.com" = {
        HostName = "github.com";
        IdentityFile = "~/.ssh/github";
        AddKeysToAgent = "yes";
      };
    };
  };
}
