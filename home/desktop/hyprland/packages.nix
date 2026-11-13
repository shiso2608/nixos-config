{ pkgs, ... }:

{
  home.packages = with pkgs; [
    loupe
    nautilus
  ];

  programs = {
    mpv.enable = true;
  };
}
