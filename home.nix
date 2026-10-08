{ ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  # 互換性の維持のためのインストール時のバージョン指定
  home.stateVersion = "26.05"; 

  # Home Manager 自体の管理を有効化
  programs.home-manager.enable = true;
}
