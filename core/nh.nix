{ ... }:

{
  programs.nh = {
    enable = true;

    # ガベージコレクション
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 9 --keep-since 7d --optimise";
    };
  };
}
