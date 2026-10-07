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
  };
}
