{ lib, pkgs, ... }: {
  home.packages = with pkgs; [
      nil
      nixfmt
  ];
  programs.vscode = {
    enable = true;
    profiles = {
      default = {
        extensions = with pkgs.nix-vscode-extensions.vscode-marketplace; [
          anteprimorac.html-end-tag-labels
          bmewburn.vscode-intelephense-client
          bradlc.vscode-tailwindcss
          christian-kohler.path-intellisense
          edwinhuish.better-comments-next
          esbenp.prettier-vscode
          gruntfuggly.todo-tree
          jnoortheen.nix-ide
          kisstkondoros.vscode-gutter-preview
          ms-azuretools.vscode-containers
          ms-azuretools.vscode-docker
          ms-vscode.live-server
          ms-vscode.theme-tomorrowkit
          quanli.focus
          shardulm94.trailing-spaces
          sirtori.indenticator
          usernamehw.errorlens
        ];
        userSettings = {
          "telemetry.telemetryLevel" = "error";
          "files.eol" = "\n";
          # "task.quickOpen.history" = 0;

          # "window.commandCenter" = false;

          # "editor.cursorBlinking" = "blink";
          # "editor.cursorSmoothCaretAnimation" = "off";
          "editor.folding" = true;
          "editor.fontFamily" = "monospace";
          "editor.fontLigatures" = true;
          "editor.fontSize" = 16;
          "editor.largeFileOptimizations" = true;
          "editor.linkedEditing" = true;
          "editor.minimap.autohide" = "mouseover";
          "editor.minimap.renderCharacters" = true;
          "editor.rulers" = [
            60
            80
          ];
          "editor.scrollbar.horizontalScrollbarSize" = 8;
          "editor.scrollbar.verticalScrollbarSize" = 8;
          "editor.showFoldingControls" = "always";
          "editor.smoothScrolling" = true;
          # "editor.stickyScroll.enabled" = false;
          "editor.unicodeHighlight.invisibleCharacters" = true;
          "editor.unicodeHighlight.nonBasicASCII" = true;
          "editor.wordWrap" = "on";

          "workbench.colorTheme" = "Tomorrow Night Eighties";
          # "workbench.activityBar.location" = "top";

          "html.completion.attributeDefaultValue" = "doublequotes";

          "nix.enableLanguageServer" = true;
          "nix.serverPath" = lib.getExe pkgs.nil;
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = [
                  (lib.getExe pkgs.nixfmt)
                ];
              };
            };
          };
        };
      };
    };
  };
}
