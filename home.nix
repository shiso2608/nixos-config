{ config, ... }:

{
  home.username = "user";
  home.homeDirectory = "/home/user";

  # 互換性の維持のためのインストール時のバージョン指定
  home.stateVersion = "26.05"; 

  # Home Manager 自体の管理を有効化
  programs.home-manager.enable = true;

  home.sessionVariables = {
    EDITOR = "hx";
    VISUAL = "hx";
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
}
