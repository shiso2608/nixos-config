{ pkgs, ... }:

{
  programs.obs-studio = {
    enable = true;

    plugins = with pkgs.obs-studio-plugins; [
      obs-vaapi
    ];
  };

  home.packages = with pkgs; [
    obs-cmd # wayland 環境でキーボードショートカットを使用するため
  ];
}
