{ lib, ... }:

{
  dconf.settings = {
    # 夜間モード
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 18.0;
      night-light-temperature = lib.hm.gvariant.mkUint32 3200;
    };

    # 自動画面ブランク
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 1200;
    };

    # 自動サスペンド
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-timeout = 1500;
    };

    # 外観
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      accent-color = "orange";
    };

    # マウス
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.3;
    };

    # プライバシー
    "org/gnome/desktop/privacy" = {
      # ファイル履歴
      remember-recent-files = false;
      # ゴミ箱
      remove-old-trash-files = true;
      remove-old-temp-files = true;
      old-files-age = lib.hm.gvariant.mkUint32 30;
      # カメラ
      disable-camera = true;
    };

    # ウィンドウ切り替え対象
    "org/gnome/shell/window-switcher" = {
      current-workspace-only = false;
    };

    # キーボードショートカット
    "org/gnome/desktop/wm/keybindings" = {
      # アプリケーションの切り替え
      switch-applications = [ ];
      switch-applications-backward = [ ];
      # ウィンドウの切り替え
      switch-windows = [
        "<Super>Tab"
        "<Alt>Tab"
      ];
      switch-windows-backward = [
        "<Shift><Super>Tab"
        "<Shift><Alt>Tab"
      ];
    };
  };
}
