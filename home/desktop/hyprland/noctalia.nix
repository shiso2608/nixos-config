{ config, ... }:

{
  programs.noctalia = {
    enable = true;

    settings = {
      shell = {
        telemetry_enabled = true;
        animation = {
          speed = 1.5;
        };

        panel = {
          launcher_placement = "attached";
        };

        screenshot = {
          directory = "${config.home.homeDirectory}/Pictures/Screenshots";
          filename_pattern = "%Y%m%d_%H%M%S";
        };
      };

      wallpaper.enabled = false;

      theme = {
        mode = "dark";
        source = "builtin";
        builtin = "Catppuccin";
      };

      brightness = {
        enable_ddcutil = true;
        sync_all_monitors = true;
      };

      idle = {
        behavior = {
          screen-off = {
            enabled = true;
            timeout = 900;
            action = "screen_off";
          };

          suspend = {
            enabled = true;
            timeout = 1200;
            action = "lock_and_suspend";
          };
        };
      };

      location = {
        auto_locate = false;
        address = "Tokyo, Japan";
      };

      nightlight = {
        enabled = true;
        temperature_day = 6500;
        temperature_night = 4000;
      };
    };
  };
}
