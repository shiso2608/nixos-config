{ config, ... }:

{
  programs.home-manager.enable = true;

  programs.nh = {
    enable = true;
    flake = "${config.home.homeDirectory}/nixos-config";

    # ガベージコレクション
    clean = {
      enable = true;
      dates = "weekly";
      extraArgs = "--keep 9 --keep-since 7d --optimise";
    };
  };

  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "peach";
  };

  programs.zsh = {
    enable = true;
    dotDir = "${config.xdg.configHome}/zsh";
    history.path = "${config.xdg.dataHome}/zsh/zsh_history";

    # 補完機能のハイライトと矢印キーの有効化
    initContent = ''
      zstyle ':completion:*' menu select
      zstyle ':completion:*:default' list-colors ''${(s.:.)LS_COLORS}
    '';

    # プラグイン
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
  };

  programs.atuin.enable = true;
  programs.starship.enable = true;

  programs.fastfetch.enable = true;
  programs.helix.enable = true;
  programs.ghostty.enable = true;
}
