{ pkgs, ... }: {
  fonts = {
    enableDefaultPackages = false;
    packages = with pkgs; [
      nerd-fonts.jetbrains-mono
      noto-fonts
      noto-fonts-color-emoji
      unifont
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
        sansSerif = [
          "Noto Sans"
          "Unifont"
        ];
        serif = [
          "Noto Serif"
          "Unifont"
        ];
        monospace = [
          "JetBrainsMono Nerd Font"
          "Unifont"
        ];
      };
    };
  };
}
