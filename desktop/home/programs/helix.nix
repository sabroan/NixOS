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
        "ui.background" = {
          bg = "#2d2d2d";
        };
        "ui.text" = {
          fg = "#cccccc";
        };
        "ui.text.focus" = {
          fg = "#ffffff";
        };
        "ui.text.inactive" = {
          fg = "#999999";
        };
        "ui.linenr" = {
          fg = "#666666";
        };
        "ui.linenr.selected" = {
          fg = "#cccccc";
        };
        "ui.cursorline.primary" = {
          bg = "#393939";
        };
        "ui.selection" = {
          bg = "#515151";
        };
        "ui.cursor" = {
          fg = "#2d2d2d";
          bg = "#cccccc";
        };
        "ui.cursor.match" = {
          fg = "#2d2d2d";
          bg = "#ffcc66";
        };
        "ui.statusline" = {
          fg = "#cccccc";
          bg = "#393939";
        };
        "ui.statusline.inactive" = {
          fg = "#999999";
          bg = "#2d2d2d";
        };
        "ui.popup" = {
          fg = "#cccccc";
          bg = "#393939";
        };
        "ui.menu" = {
          fg = "#cccccc";
          bg = "#393939";
        };
        "ui.menu.selected" = {
          fg = "#2d2d2d";
          bg = "#cccccc";
        };
        "ui.window" = {
          fg = "#515151";
        };
        "ui.virtual" = {
          fg = "#393939";
        };
        "ui.virtual.indent-guide" = {
          fg = "#393939";
        };
        "ui.virtual.ruler" = {
          bg = "#393939";
        };
        "ui.virtual.whitespaces" = {
          fg = "#393939";
        };
        "comment" = {
          fg = "#999999";
          modifiers = [ "italic" ];
        };
        "keyword" = {
          fg = "#cc99cc";
        };
        "keyword.control" = {
          fg = "#cc99cc";
        };
        "keyword.function" = {
          fg = "#cc99cc";
        };
        "keyword.operator" = {
          fg = "#cc99cc";
        };
        "type" = {
          fg = "#ffcc66";
        };
        "type.builtin" = {
          fg = "#ffcc66";
        };
        "constructor" = {
          fg = "#6699cc";
        };
        "function" = {
          fg = "#6699cc";
        };
        "function.builtin" = {
          fg = "#6699cc";
        };
        "function.macro" = {
          fg = "#6699cc";
        };
        "variable" = {
          fg = "#cccccc";
        };
        "variable.builtin" = {
          fg = "#f99157";
        };
        "variable.parameter" = {
          fg = "#cccccc";
        };
        "variable.other.member" = {
          fg = "#f2777a";
        };
        "constant" = {
          fg = "#f99157";
        };
        "constant.builtin" = {
          fg = "#f99157";
        };
        "constant.numeric" = {
          fg = "#f99157";
        };
        "string" = {
          fg = "#99cc99";
        };
        "string.regexp" = {
          fg = "#66cccc";
        };
        "operator" = {
          fg = "#f2777a";
        };
        "punctuation" = {
          fg = "#cccccc";
        };
        "punctuation.bracket" = {
          fg = "#cccccc";
        };
        "punctuation.delimiter" = {
          fg = "#cccccc";
        };
        "label" = {
          fg = "#cc99cc";
        };
        "namespace" = {
          fg = "#6699cc";
        };
        "attribute" = {
          fg = "#ffcc66";
        };
        "markup.heading" = {
          fg = "#6699cc";
        };
        "markup.bold" = {
          fg = "#ffcc66";
          modifiers = [ "bold" ];
        };
        "markup.italic" = {
          fg = "#cc99cc";
          modifiers = [ "italic" ];
        };
        "markup.link.url" = {
          fg = "#66cccc";
          modifiers = [ "underlined" ];
        };
        "markup.link.text" = {
          fg = "#6699cc";
        };
        "error" = "#f2777a";
        "warning" = "#ffcc66";
        "info" = "#6699cc";
        "hint" = "#66cccc";
        "diff.plus" = {
          fg = "#99cc99";
        };
        "diff.minus" = {
          fg = "#f2777a";
        };
        "diff.delta" = {
          fg = "#ffcc66";
        };
      };
    };
  };
}
