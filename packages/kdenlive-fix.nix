# Fix for crash while running under GNOME
# https://wiki.nixos.org/wiki/Kdenlive
{ ... }:

{
  # Fix for Kdenlive crash under GNOME
  # https://github.com/NixOS/nixpkgs/issues/469503
  nixpkgs.overlays = [
    (final: prev: {
      kdePackages = prev.kdePackages.overrideScope (
        kfinal: kprev: {
          kdenlive = prev.symlinkJoin {
            inherit (kprev.kdenlive)
              pname
              version
              meta
              passthru
              ;
            name = "kdenlive-crashfix";
            paths = [ kprev.kdenlive ];
            nativeBuildInputs = [ prev.makeWrapper ];
            postBuild = ''
              wrapProgram $out/bin/kdenlive \
                --prefix XDG_DATA_DIRS : "${prev.gtk3}/share/gsettings-schemas/${prev.gtk3.name}" \
                --set GTK_THEME Adwaita:dark
            '';
          };
        }
      );
    })
  ];
}
