{ lib, pkgs, ... }: {
  programs.yazi = {
    enable = true;
    enableNushellIntegration = true;
    plugins = {
      full-border = {
        package = pkgs.yaziPlugins.full-border;
        setup = true;
        settings = {
          type = lib.mkLuaInline "ui.Border.PLAIN";
        };
      };
      mount = {
        package = pkgs.yaziPlugins.mount;
      };
      toggle-pane = {
        package = pkgs.yaziPlugins.toggle-pane;
      };
    };
    keymap = {
      mgr.prepend_keymap = [
        {
          on = [ "M" ];
          run = "plugin mount";
          desc = "Open mount menu";
        }
        {
          on = [ "T" ];
          run = "plugin toggle-pane min-preview";
          desc = "Show or hide the preview pane";
        }
        {
          on = [ "T" ];
          run = "plugin toggle-pane man-preview";
          desc = "Maximize or restore the preview pane";
        }
      ];
    };
    settings = {
      mgr = {
        ratio = [
          0
          3
          2
        ];
        linemode = "size";
        show_hidden = true;
        show_symlink = true;
        sort_by = "natural";
        sort_dir_first = true;
        sort_reverse = false;
        sort_sensitive = false;
        sort_translit = true;
        mouse_events = [ ];
      };
      preview = {
        image_delay = 100;
        tab_size = 2;
      };
      opener = {
        edit = [
          {
            block = true;
            for = "unix";
            run = "hx %s";
          }
        ];
        extract = [
          {
            run = ''${lib.getExe pkgs.ouch} decompress "%s"'';
            desc = "Decompress archive";
            for = "unix";
          }
        ];
      };
      open = {
        prepend_rules = [
          {
            mime = "application/zip";
            use = "extract";
          }
          {
            mime = "application/x-tar";
            use = "extract";
          }
          {
            mime = "application/x-7z-compressed";
            use = "extract";
          }
          {
            mime = "application/x-rar";
            use = "extract";
          }
          {
            url = "*.{zip,tar,tar.gz,tgz,7z,rar}";
            use = "extract";
          }
        ];
        rules = [
          {
            url = "*.{json,yaml,yml,toml,ini,txt,md,nix}";
            use = "edit";
          }
          {
            mime = "text/*";
            use = "edit";
          }
          {
            url = "*";
            use = "edit";
          }
        ];
      };
    };
    theme = {
      mgr = {
        cwd = {
          fg = "#cccccc";
        };
        hovered = {
          fg = "#ffffff";
          bg = "#515151";
        };
        preview_hovered = {
          underline = true;
        };
        find_keyword = {
          fg = "#2d2d2d";
          bg = "#f99157";
          bold = true;
        };
        find_position = {
          fg = "#2d2d2d";
          bg = "#f2777a";
          bold = true;
        };
        marker_selected = {
          fg = "#6699cc";
          bg = "#6699cc";
        };
        marker_copied = {
          fg = "#ffcc66";
          bg = "#ffcc66";
        };
        marker_cut = {
          fg = "#f2777a";
          bg = "#f2777a";
        };
        marker_marked = {
          fg = "#99cc99";
          bg = "#99cc99";
        };
        count_selected = {
          fg = "#2d2d2d";
          bg = "#6699cc";
          bold = true;
        };
        count_copied = {
          fg = "#2d2d2d";
          bg = "#ffcc66";
          bold = true;
        };
        count_cut = {
          fg = "#2d2d2d";
          bg = "#f2777a";
          bold = true;
        };
        border_symbol = "│";
        border_style = {
          fg = "#515151";
        };
      };
      status = {
        overall = {
          fg = "#cccccc";
          bg = "#2d2d2d";
        };
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };
        perm_type = {
          fg = "#6699cc";
        };
        perm_read = {
          fg = "#99cc99";
        };
        perm_write = {
          fg = "#ffcc66";
        };
        perm_exec = {
          fg = "#f2777a";
        };
        perm_sep = {
          fg = "#666666";
        };
      };
      input = {
        border = {
          fg = "#6699cc";
        };
        title = {
          fg = "#cccccc";
        };
        value = {
          fg = "#ffffff";
        };
        selected = {
          reversed = true;
        };
      };
      select = {
        border = {
          fg = "#6699cc";
        };
        active = {
          fg = "#99cc99";
        };
        inactive = {
          fg = "#999999";
        };
      };
      tasks = {
        border = {
          fg = "#6699cc";
        };
        title = {
          fg = "#cccccc";
        };
        hovered = {
          underline = true;
        };
      };
      which = {
        mask = {
          bg = "#2d2d2d";
        };
        cand = {
          fg = "#6699cc";
        };
        rest = {
          fg = "#cccccc";
        };
        desc = {
          fg = "#999999";
        };
        separator = "  ";
      };
      help = {
        on = {
          fg = "#99cc99";
        };
        run = {
          fg = "#6699cc";
        };
        desc = {
          fg = "#cccccc";
        };
        hovered = {
          reversed = true;
        };
        footer = {
          fg = "#666666";
        };
      };
      notify = {
        title_info = {
          fg = "#99cc99";
        };
        title_warn = {
          fg = "#ffcc66";
        };
        title_error = {
          fg = "#f2777a";
        };
      };
      filetype = {
        rules = [
          {
            url = "*/";
            fg = "#6699cc";
            bold = true;
          }
          {
            url = "*";
            is = "link";
            fg = "#66cccc";
          }
          {
            url = "*";
            is = "exec";
            fg = "#99cc99";
          }
        ];
      };
      icon = {
        prepend_conds = [
          {
            "if" = "dir & hovered";
            text = "";
            fg = "#6699cc";
          }
          {
            "if" = "dir";
            text = "";
            fg = "#6699cc";
          }
        ];
      };
    };
  };
}
