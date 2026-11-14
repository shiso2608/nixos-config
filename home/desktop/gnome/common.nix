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
  };
}
