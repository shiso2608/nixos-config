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
    git
    helix
    nano
    trashy
    wget
    wl-clipboard
  ];

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "peach";
  };

  programs.steam.enable = true;
}
