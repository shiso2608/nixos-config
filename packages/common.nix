{ lib, pkgs, ... }:

{
  # 非フリーパッケージの個別許可
  nixpkgs.config.allowUnfreePredicate =
    pkg:
    builtins.elem (lib.getName pkg) [
      "steam"
      "steam-unwrapped"
    ];

  environment.systemPackages = with pkgs; [
    curl
    ffmpegthumbnailer
    firefox
    gdu
    nano
    rsync
    trashy
    wget
    wl-clipboard
  ];

  programs = {
    git.enable = true;
    steam.enable = true;
    zsh.enable = true; # デフォルトシェルを指定するために必要
  };
}
