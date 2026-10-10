{ lib, pkgs, ... }: {
  home = {
    packages = with pkgs; [
      nil
      nixfmt
    ];
    persistence = {
      "/nix/state/home" = {
        directories = [
          {
            directory = ".config/Code/User/globalStorage";
            mode = "0700";
          }
        ];
      };
    };
  };

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
          "chat.agent.codeBlockProgress" = false;
          "chat.agent.enabled" = false;
          "chat.agent.thinking.generateTitles" = false;
          "chat.detectParticipant.enabled" = false;
          "chat.disableAIFeatures" = true;
          "chat.extensionTools.enabled" = false;
          "chat.extensionUnification.enabled" = false;
          "chat.implicitContext.suggestedContext" = false;
          "chat.math.enabled" = false;
          "chat.tools.todos.showWidget" = false;
          "chat.viewSessions.enabled" = false;
          "editor.cursorBlinking" = "blink";
          "editor.cursorSmoothCaretAnimation" = "off";
          "editor.cursorStyle" = "line";
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
          "editor.stickyScroll.enabled" = false;
          "editor.unicodeHighlight.invisibleCharacters" = true;
          "editor.unicodeHighlight.nonBasicASCII" = true;
          "editor.wordWrap" = "on";
          "errorLens.enabledDiagnosticLevels" = [
            "warning"
            "info"
            "error"
          ];
          "files.eol" = "\n";
          "focus.highlightRange" = "block";
          "html.completion.attributeDefaultValue" = "doublequotes";
          "intelephense.completion.fullyQualifyGlobalConstantsAndFunctions" = true;
          "intelephense.completion.insertUseDeclaration" = true;
          "intelephense.diagnostics.relaxedTypeCheck" = false;
          "intelephense.diagnostics.strictTypes" = true;
          "intelephense.inlayHint.parameterNames" = false;
          "intelephense.rename.namespaceMode" = "all";
          "nix.enableLanguageServer" = true;
          "nix.serverPath" = lib.getExe pkgs.nil;
          "nix.serverSettings" = {
            "nil" = {
              "formatting" = {
                "command" = [ (lib.getExe pkgs.nixfmt) ];
              };
            };
          };
          "task.quickOpen.history" = 0;
          "telemetry.telemetryLevel" = "error";
          "terminal.integrated.cursorBlinking" = true;
          "terminal.integrated.cursorStyle" = "line";
          "terminal.integrated.fontSize" = 14;
          "terminal.integrated.scrollback" = 100;
          "terminal.integrated.smoothScrolling" = true;
          "window.commandCenter" = false;
          "workbench.activityBar.location" = "top";
          "workbench.colorTheme" = "Tomorrow Night Eighties";
          "workbench.commandPalette.history" = 0;
          "workbench.editor.editorActionsLocation" = "hidden";
          "workbench.layoutControl.enabled" = false;
          "workbench.list.smoothScrolling" = true;
          "workbench.startupEditor" = "none";
          "workbench.tips.enabled" = false;
          "workbench.tree.enableStickyScroll" = false;
          "workbench.tree.indent" = 14;
        };
      };
    };
  };
}
