{ lib, ... }:

{
  dconf.settings = {
    "org/gnome/settings-daemon/plugins/color" = {
      night-light-enabled = true;
      night-light-schedule-automatic = false;
      night-light-schedule-from = 18.0;
      night-light-temperature = lib.hm.gvariant.mkUint32 3200;
    };
  };
}
