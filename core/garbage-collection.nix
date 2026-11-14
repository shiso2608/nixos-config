{ ... }:

{
  boot.tmp.cleanOnBoot = true;
  nix.settings.auto-optimise-store = true;

  nix.gc = {
    automatic = true;
    dates = "weekly";
    persistent = true;
    randomizedDelaySec = "10min";
    options = "--delete-older-than 30d";
  };
}
