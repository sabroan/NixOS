{ pkgs, ... }:
let
  openmw = pkgs.symlinkJoin {
    name = "openmw";
    paths = [ pkgs.openmw ];
    nativeBuildInputs = [ pkgs.makeWrapper ];
    postBuild = ''
      for exe in $out/bin/*; do
        if [ -f "$exe" ] && [ -x "$exe" ]; then
          wrapProgram "$exe" \
            --prefix XDG_DATA_DIRS : "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
        fi
      done
    '';
  };
in
{
  home.packages = [ openmw ];

  home.persistence."/nix/state/home" = {
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
}
