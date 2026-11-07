{ config, ... }:

{
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
}
