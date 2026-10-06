{ ... }: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    presets = [
      "nerd-font-symbols"
    ];
    settings = {
      add_newline = true;
      palette = "tomorrow-night-eighties";
      palettes = {
        tomorrow-night-eighties = {
          background = "#2D2D2D";
          foreground = "#CCCCCC";
          dark = "#515151";
          gray = "#999999";
          red = "#F2777A";
          orange = "#F99157";
          yellow = "#FFCC66";
          green = "#99CC99";
          cyan = "#66CCCC";
          blue = "#6699CC";
          purple = "#CC99CC";
        };
      };

      format = builtins.concatStringsSep "" [
        "$os"
        "$username"
        "$hostname"
        "$fill"
        "$git_branch"
        "$git_status"
        "$nodejs"
        "$bun"
        "$php"
        # "$time"
        # "$cmd_duration"
        "$line_break"
        "$directory"
        "$character"
      ];

      right_format = builtins.concatStringsSep "" [
        "$time"
        "$cmd_duration"
      ];

      os = {
        disabled = false;
        style = "bg:none fg:blue";
      };

      username = {
        show_always = false;
        style_user = "bg:none fg:foreground";
        style_root = "bg:none fg:red";
        format = "[ $user ]($style)";
      };

      hostname = {
        ssh_only = true;
      };

      directory = {
        style = "bold bg:none fg:foreground";
        format = "[[$path]($style)[$read_only]($read_only_style) ](bg:none)";
        truncation_length = 3;
        truncation_symbol = "…/";
        substitutions = {
          Downloads = " ";
        };
      };

      git_branch = {
        symbol = "";
        style = "bg:none";
        format = "[[ $symbol$branch ](fg:foreground bg:none)]($style)";
      };

      git_status = {
        style = "bg:none";
        format = "[[( $all_status$ahead_behind )](fg:gray bg:none)]($style)";
      };

      nodejs = {
        symbol = "";
        style = "bg:none";
        format = "[[ $symbol($version) ](fg:green bg:none)]($style)";
      };

      bun = {
        symbol = "";
        style = "bg:none";
        format = "[[ $symbol($version) ](fg:foreground bg:none)]($style)";
      };

      php = {
        symbol = "";
        style = "bg:none";
        format = "[[ $symbol($version) ](fg:purple bg:none)]($style)";
      };

      docker_context = {
        symbol = "";
        style = "bg:none";
        format = "[[ $symbol($context) ](fg:blue bg:none)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R";
        style = "bg:none";
        format = "[[  $time ](fg:purple bg:none)]($style)";
      };

      fill = {
        symbol = " ";
      };

      line_break = {
        disabled = false;
      };

      character = {
        disabled = false;
        success_symbol = "[❯](bold fg:green)";
        error_symbol = "[❯](bold fg:red)";
      };

      cmd_duration = {
        disabled = false;
        style = "bg:none";
        format = "[[󱦟 $duration](italic fg:cyan bg:none)]($style)";
        min_time_to_notify = 45000;
        show_milliseconds = false;
        show_notifications = true;
      };
    };
  };
}
