{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    brave
    gimp
    google-chrome
    kdePackages.kdenlive
    libreoffice
    loupe
    nautilus
    protonmail-desktop
    super-productivity
  ];

  programs = {
    atuin.enable = true;
    home-manager.enable = true;
    mpv.enable = true;
    prismlauncher.enable = true;
  };
}
