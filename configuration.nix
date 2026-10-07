{ ... }:

{
  imports = [
    ./core
    ./desktop
    ./hardware
    ./packages
    ./users
  ];

  # 互換性の維持のためのインストール時のバージョン指定
  system.stateVersion = "26.05";
}
