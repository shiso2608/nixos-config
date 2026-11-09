{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    gimp
    google-chrome
    kdePackages.kdenlive
    libreoffice
    librewolf
    loupe
    nautilus
    protonmail-desktop
    super-productivity
    thunderbird
  ];

  programs = {
    atuin.enable = true;
    home-manager.enable = true;
    mpv.enable = true;
    prismlauncher.enable = true;
  };
}
