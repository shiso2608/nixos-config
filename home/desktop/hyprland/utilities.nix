{ pkgs, ... }:

{
  services.hyprpaper = {
    enable = true;

    settings = {
      splash = false;

      wallpaper = [
        {
          monitor = "";
          path = "${pkgs.nixos-artwork.wallpapers.nineish-catppuccin-macchiato-alt}/share/backgrounds/nixos/nix-wallpaper-nineish-catppuccin-macchiato-alt.png";
        }
      ];
    };
  };
}
