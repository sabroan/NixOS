{ pkgs, ... }: {
  home = {
    packages = with pkgs; [ openmw ];
    persistence = {
      "/nix/state/home" = {
        directories = [
          {
            directory = ".config/openmw";
            mode = "0700";
          }
          {
            directory = ".local/share/openmw";
            mode = "0700";
          }
        ];
      };
    };
  };
  programs.nushell.extraConfig = ''
    def openmw-wizard [] {
      let gtkSchema = (^sh -c 'find /nix/store -path "*/share/gsettings-schemas/gtk+3-*/glib-2.0/schemas/org.gtk.Settings.FileChooser.gschema.xml" 2>/dev/null | head -1' | str trim)
      if ($gtkSchema | is-empty) {
          print "GTK 3 file chooser schema not found."
          return
      }
      let schemaDir = ($gtkSchema | path dirname)
      with-env { GSETTINGS_SCHEMA_DIR: $schemaDir } {
        ^openmw-wizard
      }
    }
  '';
}
