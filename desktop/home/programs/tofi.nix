{ lib, pkgs, ... }: {
  programs.tofi = {
    enable = true;
    settings = {
      anchor = "center";
      ascii-input = true;
      background-color = "#2d2d2dfa";
      border-width = 0;
      drun-launch = false;
      font = "monospace";
      font-size = 20;
      height = "100%";
      hide-cursor = true;
      history = false;
      horizontal = false;
      num-results = 25;
      outline-width = 0;
      padding-bottom = "5%";
      padding-left = "40%";
      padding-right = "5%";
      padding-top = "5%";
      placeholder-text = "";
      prompt-text = "";
      result-spacing = 10;
      selection-color = "#ffcc66";
      terminal = lib.getExe' pkgs.foot "footclient";
      text-color = "#999999";
      width = "100%";
    };
  };
}
