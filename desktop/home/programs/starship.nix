{ ... }: {
  programs.starship = {
    enable = true;
    enableNushellIntegration = true;
    presets = [
      "nerd-font-symbols"
    ];
    settings = {
      add_newline = true;

      format = builtins.concatStringsSep "" [
        "$os"
        "$username"
        "$hostname"
        "$line_break"
        "$directory"
        "$character"
      ];

      right_format = builtins.concatStringsSep "" [
        "$git_status"
        "$git_branch"
        "$nodejs"
        "$bun"
        "$php"
        "$time"
        "$cmd_duration"
      ];

      os = {
        disabled = false;
        style = "bg:none fg:blue";
      };

      username = {
        disabled = false;
        show_always = false;
        style_user = "bg:none fg:white";
        style_root = "bg:none fg:red";
        format = "[$user]($style)";
      };

      hostname = {
        disabled = false;
        ssh_only = true;
      };

      directory = {
        disabled = false;
        style = "bold bg:none fg:white";
        format = "[$path]($style)[$read_only]($read_only_style)";
        substitutions = {
          Downloads = " ";
        };
      };

      git_branch = {
        disabled = false;
        style = "fg:blue bg:none";
        format = "[$symbol$branch(:$remote_branch)]($style)";
      };

      git_status = {
        disabled = false;
        style = "fg:yellow bg:none";
        format = "[$all_status$ahead_behind]($style)";
      };

      nodejs = {
        disabled = false;
        symbol = "";
        style = "fg:green bg:none";
        format = "[$symbol($version)]($style)";
      };

      bun = {
        disabled = false;
        symbol = "";
        style = "fg:white bg:none";
        format = "[$symbol($version)]($style)";
      };

      php = {
        disabled = false;
        symbol = "";
        style = "fg:purple bg:none";
        format = "[$symbol($version)]($style)";
      };

      docker_context = {
        disabled = false;
        symbol = "";
        style = "fg:blue bg:none";
        format = "[$symbol($context)]($style)";
      };

      time = {
        disabled = false;
        time_format = "%R:%S";
        style = "fg:gray bg:none";
        format = "[ $time]($style)";
      };

      fill = {
        disabled = false;
        symbol = " ";
      };

      character = {
        disabled = false;
        format = " $symbol ";
        success_symbol = "[❯](bold fg:green)";
        error_symbol = "[✗](bold fg:red)";
      };

      cmd_duration = {
        disabled = false;
        style = "fg:gray bg:none";
        format = "[ 󱦟 $duration]($style)";
        min_time_to_notify = 45000;
        show_milliseconds = false;
        show_notifications = true;
      };
    };
  };
}
