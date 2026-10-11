{ config, lib, ... }:

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

  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # systemd と UWSM の競合を回避
    configType = "lua";

    settings = {
      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("noctalia")
            end
          '')
        ];
      };
    };
  };

  programs.noctalia.enable = true;

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
}
