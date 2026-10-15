{ pkgs, ... }:

{
  home.packages = with pkgs; [
    gnome-music
    loupe
    nautilus
    showtime
  ];

  programs = {
    atuin.enable = true;
    home-manager.enable = true;
    ghostty.enable = true;
  };
}
