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
      # --- File Manager Pane ---
      mgr = {
        cwd = {
          fg = "white";
        };
        hovered = {
          fg = "lightwhite";
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
          bg = "red";
          bold = true;
        };
        marker_selected = {
          fg = "blue";
          bg = "blue";
        };
        marker_copied = {
          fg = "yellow";
          bg = "yellow";
        };
        marker_cut = {
          fg = "red";
          bg = "red";
        };
        marker_marked = {
          fg = "green";
          bg = "green";
        };
        count_selected = {
          fg = "#2d2d2d";
          bg = "blue";
          bold = true;
        };
        count_copied = {
          fg = "#2d2d2d";
          bg = "yellow";
          bold = true;
        };
        count_cut = {
          fg = "#2d2d2d";
          bg = "red";
          bold = true;
        };
        border_symbol = "│";
        border_style = {
          fg = "#515151";
        };
        symlink_target = {
          fg = "cyan";
          italic = true;
        };
      };

      # --- Mode Indicators ---
      mode = {
        normal_main = {
          fg = "#2d2d2d";
          bg = "blue";
          bold = true;
        };
        normal_alt = {
          fg = "blue";
          bg = "#393939";
        };
        select_main = {
          fg = "#2d2d2d";
          bg = "green";
          bold = true;
        };
        select_alt = {
          fg = "green";
          bg = "#393939";
        };
        unset_main = {
          fg = "#2d2d2d";
          bg = "red";
          bold = true;
        };
        unset_alt = {
          fg = "red";
          bg = "#393939";
        };
      };

      # --- Tab Bar ---
      tabs = {
        active = {
          fg = "#2d2d2d";
          bg = "blue";
          bold = true;
        };
        inactive = {
          fg = "white";
          bg = "#393939";
        };
        sep_left = {
          open = "";
          close = "";
        };
        sep_right = {
          open = "";
          close = "";
        };
      };

      # --- Pane Scroll / Position Indicators ---
      indicator = {
        parent = {
          fg = "#515151";
        };
        current = {
          fg = "blue";
        };
        preview = {
          fg = "#515151";
        };
      };

      # --- Status Bar ---
      status = {
        overall = {
          fg = "white";
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
          fg = "blue";
        };
        perm_read = {
          fg = "green";
        };
        perm_write = {
          fg = "yellow";
        };
        perm_exec = {
          fg = "red";
        };
        perm_sep = {
          fg = "gray";
        };
      };

      # --- Input Popup ---
      input = {
        border = {
          fg = "blue";
        };
        title = {
          fg = "white";
        };
        value = {
          fg = "lightwhite";
        };
        selected = {
          reversed = true;
        };
      };

      # --- Selection Dialog ---
      select = {
        border = {
          fg = "blue";
        };
        active = {
          fg = "green";
        };
        inactive = {
          fg = "gray";
        };
      };

      # --- Confirmation Dialog ---
      confirm = {
        border = {
          fg = "blue";
        };
        title = {
          fg = "blue";
          bold = true;
        };
        content = {
          fg = "white";
        };
        list = {
          fg = "white";
        };
        btn_yes = {
          fg = "#2d2d2d";
          bg = "green";
          bold = true;
        };
        btn_no = {
          fg = "white";
          bg = "#393939";
        };
      };

      # --- Completion Popup ---
      cmp = {
        border = {
          fg = "blue";
        };
        active = {
          fg = "#2d2d2d";
          bg = "blue";
        };
        inactive = {
          fg = "white";
        };
      };

      # --- Tasks Manager Popup ---
      tasks = {
        border = {
          fg = "blue";
        };
        title = {
          fg = "white";
        };
        hovered = {
          underline = true;
        };
      };

      # --- Which-Key Popup ---
      which = {
        mask = {
          bg = "#2d2d2d";
        };
        cand = {
          fg = "blue";
        };
        rest = {
          fg = "white";
        };
        desc = {
          fg = "gray";
        };
        separator = "  ";
      };

      # --- Help Menu ---
      help = {
        chord = {
          fg = "green";
        };
        action = {
          fg = "blue";
        };
        desc = {
          fg = "white";
        };
        hovered = {
          reversed = true;
        };
        footer = {
          fg = "gray";
        };
      };

      # --- Notifications ---
      notify = {
        title_info = {
          fg = "green";
        };
        title_warn = {
          fg = "yellow";
        };
        title_error = {
          fg = "red";
        };
      };

      # --- File Type Overrides ---
      filetype = {
        rules = [
          {
            url = "*/";
            fg = "blue";
            bold = true;
          }
          {
            url = "*";
            is = "link";
            fg = "cyan";
          }
          {
            url = "*";
            is = "exec";
            fg = "green";
          }
        ];
      };

      # --- Icon Overrides ---
      icon = {
        prepend_conds = [
          {
            "if" = "dir & hovered";
            text = "";
            fg = "blue";
          }
          {
            "if" = "dir";
            text = "";
            fg = "yellow";
          }
        ];
      };
    };
  };
}
