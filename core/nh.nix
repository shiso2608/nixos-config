{ ... }:

{
  programs.nh = {
    enable = true;
    flake = "/home/user/nixos-config";

    # ガベージコレクション
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 9 --keep-since 7d --optimise";
    };
  };
}
