{ inputs, pkgs, ... }:
let
  prettify = parser: {
    command = "prettier";
    args = [
      "--parser"
      parser
      "--stdin-filepath"
      "%{buffer_name}"
    ];
  };
  typescript-lsp = [
    "typescript-language-server"
    "eslint"
  ];
in
{
  programs.helix = {
    enable = true;
    package = inputs.chaotic.packages.${pkgs.stdenv.hostPlatform.system}.helix_git;
    defaultEditor = true;
    extraPackages = with pkgs; [
      color-lsp
      intelephense
      nil
      nixfmt
      prettier
      typescript
      typescript-language-server
      vscode-langservers-extracted
    ];
    languages = {
      language-server = {
        color-lsp = {
          command = "color-lsp";
        };
      };
      language = [
        {
          name = "nix";
          auto-format = true;
          formatter = {
            command = "nixfmt";
          };
          language-servers = [
            "nil"
            "color-lsp"
          ];
        }
        {
          name = "php";
          auto-format = true;
          language-servers = [ "intelephense" ];
        }
        {
          name = "typescript";
          auto-format = true;
          formatter = prettify "typescript";
          language-servers = typescript-lsp;
        }
        {
          name = "javascript";
          auto-format = true;
          formatter = prettify "babel";
          language-servers = typescript-lsp;
        }
        {
          name = "html";
          auto-format = true;
          formatter = prettify "html";
          language-servers = [ "vscode-html-language-server" ];
        }
        {
          name = "css";
          auto-format = true;
          formatter = prettify "css";
          language-servers = [ "vscode-css-language-server" ];
        }
      ];
    };
    settings = {
      theme = "tomorrow-night-eighties";
      editor = {
        auto-completion = true;
        auto-pairs = true;
        bufferline = "multiple";
        color-modes = true;
        completion-timeout = 5;
        completion-trigger-len = 1;
        cursor-shape = {
          insert = "bar";
          normal = "block";
          select = "block";
        };
        cursorcolumn = false;
        cursorline = true;
        idle-timeout = 250;
        indent-guides = {
          render = true;
          character = "│";
          skip-levels = 1;
        };
        inline-diagnostics = {
          cursor-line = "warning";
        };
        gutters = {
          line-numbers = {
            min-width = 1;
          };
        };
        line-number = "absolute";
        lsp = {
          display-color-swatches = true;
        };
        mouse = false;
        rainbow-brackets = true;
        rulers = [
          60
          80
        ];
        scroll-lines = 10;
        soft-wrap = {
          enable = true;
        };
        statusline = {
          left = [
            "mode"
            "spinner"
            "file-name"
          ];

          center = [
            "file-modification-indicator"
          ];

          right = [
            "diagnostics"
            "selections"
            "position"
            "file-encoding"
            "file-line-ending"
            "file-type"
          ];

          separator = "│";
          mode.normal = "NORMAL";
          mode.insert = "INSERT";
          mode.select = "SELECT";
        };
        whitespace = {
          render = "all";
          characters = {
            space = "·";
            nbsp = "⍽";
            nnbsp = "␣";
            tab = "→";
            newline = "⏎";
            tabpad = "·";
          };
        };
      };
    };
    themes = {
      tomorrow-night-eighties = {
        # Custom palette additions for colors missing from standard 16 ANSI slots
        palette = {
          bg = "#2d2d2d";
          current_line = "#393939";
          selection = "#515151";
          orange = "#f99157";
        };

        # Base UI
        "ui.background" = {
          bg = "bg";
        };
        "ui.text" = {
          fg = "white";
        };
        "ui.text.focus" = {
          fg = "light-white";
          modifiers = [ "bold" ];
        };
        "ui.text.inactive" = {
          fg = "light-black";
        };
        "ui.text.info" = {
          fg = "blue";
        };
        "ui.text.directory" = {
          fg = "blue";
          modifiers = [ "bold" ];
        };
        "ui.text.symlink" = {
          fg = "cyan";
        };

        # Line Numbers & Gutters
        "ui.linenr" = {
          fg = "light-black";
        };
        "ui.linenr.selected" = {
          fg = "white";
          modifiers = [ "bold" ];
        };
        "ui.gutter" = {
          bg = "bg";
        };
        "ui.gutter.selected" = {
          fg = "white";
        };

        # Cursor & Selection
        "ui.cursorline.primary" = {
          bg = "current_line";
        };
        "ui.cursorline.secondary" = {
          bg = "current_line";
        };
        "ui.cursorcolumn.primary" = {
          bg = "current_line";
        };
        "ui.cursorcolumn.secondary" = {
          bg = "current_line";
        };
        "ui.selection" = {
          bg = "selection";
        };
        "ui.selection.primary" = {
          bg = "selection";
        };
        "ui.selection.secondary" = {
          bg = "current_line";
        };
        "ui.cursor" = {
          fg = "bg";
          bg = "white";
        };
        "ui.cursor.normal" = {
          fg = "bg";
          bg = "white";
        };
        "ui.cursor.insert" = {
          fg = "bg";
          bg = "green";
        };
        "ui.cursor.select" = {
          fg = "bg";
          bg = "magenta";
        };
        "ui.cursor.match" = {
          fg = "bg";
          bg = "yellow";
        };
        "ui.cursor.primary" = {
          fg = "bg";
          bg = "white";
        };

        # Statusline & Bufferline
        "ui.statusline" = {
          fg = "white";
          bg = "current_line";
        };
        "ui.statusline.inactive" = {
          fg = "light-black";
          bg = "bg";
        };
        "ui.statusline.normal" = {
          fg = "bg";
          bg = "blue";
          modifiers = [ "bold" ];
        };
        "ui.statusline.insert" = {
          fg = "bg";
          bg = "green";
          modifiers = [ "bold" ];
        };
        "ui.statusline.select" = {
          fg = "bg";
          bg = "magenta";
          modifiers = [ "bold" ];
        };
        "ui.statusline.separator" = {
          fg = "light-black";
          bg = "current_line";
        };
        "ui.bufferline" = {
          fg = "light-black";
          bg = "bg";
        };
        "ui.bufferline.active" = {
          fg = "white";
          bg = "current_line";
          modifiers = [ "bold" ];
        };
        "ui.bufferline.background" = {
          bg = "bg";
        };

        # Popups & Pickers
        "ui.popup" = {
          fg = "white";
          bg = "current_line";
        };
        "ui.popup.info" = {
          fg = "white";
          bg = "current_line";
        };
        "ui.menu" = {
          fg = "white";
          bg = "current_line";
        };
        "ui.menu.selected" = {
          fg = "bg";
          bg = "white";
        };
        "ui.menu.scroll" = {
          fg = "light-black";
          bg = "bg";
        };
        "ui.window" = {
          fg = "current_line";
        };
        "ui.help" = {
          fg = "white";
          bg = "current_line";
        };
        "ui.picker.header" = {
          fg = "blue";
          modifiers = [ "bold" ];
        };
        "ui.picker.header.column" = {
          fg = "light-black";
        };
        "ui.picker.header.column.active" = {
          fg = "yellow";
          modifiers = [ "bold" ];
        };
        "ui.highlight" = {
          bg = "selection";
        };

        # Virtual Text & Inlay Hints
        "ui.virtual" = {
          fg = "selection";
        };
        "ui.virtual.indent-guide" = {
          fg = "selection";
        };
        "ui.virtual.ruler" = {
          bg = "current_line";
        };
        "ui.virtual.whitespaces" = {
          fg = "selection";
        };
        "ui.virtual.inlay-hint" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "ui.virtual.inlay-hint.parameter" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "ui.virtual.inlay-hint.type" = {
          fg = "yellow";
          modifiers = [ "italic" ];
        };
        "ui.virtual.wrap" = {
          fg = "selection";
        };
        "ui.virtual.jump-label" = {
          fg = "orange";
          modifiers = [ "bold" ];
        };

        # Debugger
        "ui.debug.breakpoint" = {
          fg = "red";
        };
        "ui.debug.active" = {
          fg = "yellow";
        };
        "ui.highlight.frameline" = {
          bg = "current_line";
        };

        # Code Syntax Highlighting
        "comment" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "comment.line" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "comment.block" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "comment.documentation" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "comment.unused" = {
          fg = "light-black";
          modifiers = [ "line-through" ];
        };

        "keyword" = {
          fg = "magenta";
        };
        "keyword.control" = {
          fg = "magenta";
        };
        "keyword.control.conditional" = {
          fg = "magenta";
        };
        "keyword.control.repeat" = {
          fg = "magenta";
        };
        "keyword.control.import" = {
          fg = "magenta";
        };
        "keyword.control.return" = {
          fg = "magenta";
        };
        "keyword.control.exception" = {
          fg = "magenta";
        };
        "keyword.function" = {
          fg = "magenta";
        };
        "keyword.operator" = {
          fg = "magenta";
        };
        "keyword.directive" = {
          fg = "magenta";
        };
        "keyword.storage" = {
          fg = "magenta";
        };
        "keyword.storage.type" = {
          fg = "magenta";
        };
        "keyword.storage.modifier" = {
          fg = "magenta";
        };

        "type" = {
          fg = "yellow";
        };
        "type.builtin" = {
          fg = "yellow";
        };
        "type.enum" = {
          fg = "yellow";
        };
        "type.enum.variant" = {
          fg = "orange";
        };
        "constructor" = {
          fg = "blue";
        };

        "function" = {
          fg = "blue";
        };
        "function.builtin" = {
          fg = "blue";
        };
        "function.method" = {
          fg = "blue";
        };
        "function.method.private" = {
          fg = "blue";
        };
        "function.macro" = {
          fg = "blue";
        };
        "function.special" = {
          fg = "blue";
        };

        "variable" = {
          fg = "white";
        };
        "variable.builtin" = {
          fg = "orange";
        };
        "variable.parameter" = {
          fg = "white";
        };
        "variable.other.member" = {
          fg = "red";
        };

        "constant" = {
          fg = "orange";
        };
        "constant.builtin" = {
          fg = "orange";
        };
        "constant.builtin.boolean" = {
          fg = "orange";
        };
        "constant.numeric" = {
          fg = "orange";
        };
        "constant.numeric.integer" = {
          fg = "orange";
        };
        "constant.numeric.float" = {
          fg = "orange";
        };
        "constant.character" = {
          fg = "orange";
        };
        "constant.character.escape" = {
          fg = "cyan";
        };

        "string" = {
          fg = "green";
        };
        "string.regexp" = {
          fg = "cyan";
        };
        "string.special" = {
          fg = "cyan";
        };
        "string.special.path" = {
          fg = "green";
          modifiers = [ "underlined" ];
        };
        "string.special.url" = {
          fg = "cyan";
          modifiers = [ "underlined" ];
        };
        "string.special.symbol" = {
          fg = "orange";
        };

        "operator" = {
          fg = "cyan";
        };
        "punctuation" = {
          fg = "white";
        };
        "punctuation.bracket" = {
          fg = "white";
        };
        "punctuation.delimiter" = {
          fg = "white";
        };
        "punctuation.special" = {
          fg = "red";
        };

        "label" = {
          fg = "magenta";
        };
        "namespace" = {
          fg = "blue";
        };
        "attribute" = {
          fg = "yellow";
        };
        "special" = {
          fg = "yellow";
        };

        # Prose / Markup
        "markup.heading" = {
          fg = "blue";
          modifiers = [ "bold" ];
        };
        "markup.heading.1" = {
          fg = "blue";
          modifiers = [ "bold" ];
        };
        "markup.heading.2" = {
          fg = "cyan";
          modifiers = [ "bold" ];
        };
        "markup.heading.3" = {
          fg = "green";
          modifiers = [ "bold" ];
        };
        "markup.heading.4" = {
          fg = "yellow";
          modifiers = [ "bold" ];
        };
        "markup.heading.5" = {
          fg = "magenta";
          modifiers = [ "bold" ];
        };
        "markup.heading.6" = {
          fg = "red";
          modifiers = [ "bold" ];
        };
        "markup.list" = {
          fg = "red";
        };
        "markup.list.numbered" = {
          fg = "yellow";
        };
        "markup.list.unnumbered" = {
          fg = "red";
        };
        "markup.bold" = {
          fg = "yellow";
          modifiers = [ "bold" ];
        };
        "markup.italic" = {
          fg = "magenta";
          modifiers = [ "italic" ];
        };
        "markup.strikethrough" = {
          modifiers = [ "line-through" ];
        };
        "markup.raw" = {
          fg = "green";
        };
        "markup.raw.inline" = {
          fg = "green";
        };
        "markup.raw.block" = {
          fg = "green";
        };
        "markup.quote" = {
          fg = "light-black";
          modifiers = [ "italic" ];
        };
        "markup.link.url" = {
          fg = "cyan";
          modifiers = [ "underlined" ];
        };
        "markup.link.text" = {
          fg = "blue";
        };
        "markup.link.label" = {
          fg = "magenta";
        };

        # Diagnostics & Diff
        "error" = "red";
        "warning" = "yellow";
        "info" = "blue";
        "hint" = "cyan";
        "error.diagnostic.inline" = {
          fg = "red";
          modifiers = [ "bold" ];
        };
        "warning.diagnostic.inline" = {
          fg = "yellow";
          modifiers = [ "bold" ];
        };
        "info.diagnostic.inline" = {
          fg = "blue";
          modifiers = [ "bold" ];
        };
        "hint.diagnostic.inline" = {
          fg = "cyan";
          modifiers = [ "bold" ];
        };
        "diagnostic.deprecated" = {
          modifiers = [ "line-through" ];
        };
        "diagnostic.unnecessary" = {
          fg = "light-black";
        };

        "diff.plus" = {
          fg = "green";
        };
        "diff.minus" = {
          fg = "red";
        };
        "diff.delta" = {
          fg = "yellow";
        };
        "diff.plus.gutter" = {
          fg = "green";
        };
        "diff.minus.gutter" = {
          fg = "red";
        };
        "diff.delta.gutter" = {
          fg = "yellow";
        };
      };
    };
  };
}
