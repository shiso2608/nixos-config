{ lib, pkgs, ... }:

{
  # 非フリーパッケージの個別許可
  nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
    "steam"
    "steam-unwrapped"
  ];

  environment.systemPackages = with pkgs; [
    curl
    ffmpegthumbnailer
    firefox
    gdu
    git
    nano
    rsync
    trashy
    wget
    wl-clipboard
  ];

  programs = {
    steam.enable = true;
    zsh.enable = true; # デフォルトシェルを指定するために必要
  };
}
