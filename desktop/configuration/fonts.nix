{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
    ];
    fontconfig = {
      enable = true;
      antialias = true;
      cache32Bit = true;
      hinting = {
        enable = true;
        style = "slight";
      };
      subpixel = {
        rgba = "rgb";
        lcdfilter = "default";
      };
      defaultFonts = {
        emoji = [ "Noto Color Emoji" ];
        sansSerif = [ "Noto Sans" ];
        serif = [ "Noto Serif" ];
        monospace = [ "JetBrainsMono Nerd Font" ];
      };
    };
  };
}
