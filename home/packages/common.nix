{ pkgs, ... }:

{
  home.packages = with pkgs; [
    bitwarden-desktop
    gimp
    google-chrome
    kdePackages.kdenlive
    libreoffice
    librewolf
    protonmail-desktop
    super-productivity
    thunderbird
  ];

  programs = {
    atuin.enable = true;
    home-manager.enable = true;
    nh.enable = true;
    prismlauncher.enable = true;
  };
}
