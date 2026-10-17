{ pkgs, ... }:

{
  home.packages = with pkgs; [
    age
    bitwarden-desktop
    brave
    gimp
    gnome-music
    kdePackages.kdenlive
    libreoffice
    loupe
    nautilus
    protonmail-desktop
    showtime
    super-productivity
  ];

  programs = {
    atuin.enable = true;
    home-manager.enable = true;
    prismlauncher.enable = true;
  };
}
