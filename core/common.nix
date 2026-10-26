{ ... }:

{
  # 互換性の維持のためのインストール時のバージョン指定
  system.stateVersion = "26.05";
  nix.settings.experimental-features = [
    "nix-command"
    "flakes"
  ];
  # Electron, Chromium 互換
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
  services.fwupd.enable = true;
}
