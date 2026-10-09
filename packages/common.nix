{ pkgs, ... }:

{
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
}
