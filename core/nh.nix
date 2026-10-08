{ ... }:

{
  programs.nh = {
    enable = true;
    flake = "~/nixos-config";

    # ガベージコレクション
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 9 --keep-since 7d --optimise";
    };
  };
}
