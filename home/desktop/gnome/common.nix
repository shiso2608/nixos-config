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

    # マウス
    "org/gnome/desktop/peripherals/mouse" = {
      accel-profile = "flat";
      speed = -0.3;
    };
  };
}
