{ ... }:

{
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  # Electron, Chromium 互換
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
