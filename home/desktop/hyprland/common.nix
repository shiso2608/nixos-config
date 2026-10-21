{ config, lib, ... }:

{
  wayland.windowManager.hyprland = {
    enable = true;
    systemd.enable = false; # systemd と UWSM の競合を回避
    configType = "lua";

    settings = {
      bind = import ./keybinds.nix { inherit lib; };

      mod = {
        _var = "SUPER";
      };
      home = {
        _var = "${config.home.homeDirectory}";
      };

      on = {
        _args = [
          "hyprland.start"
          (lib.generators.mkLuaInline ''
            function()
              hl.exec_cmd("uwsm app -- hyprpaper")
              hl.exec_cmd("uwsm app -- noctalia")
            end
          '')
        ];
      };

      config = {
        general = {
          gaps_in = 2;
          gaps_out = 4;
          border_size = 2;

          col = {
            active_border = "rgba(ff7f50aa)"; # coral
            inactive_border = "rgba(595959aa)";
          };
        };

        misc = {
          disable_hyprland_logo = true;
        };

        input = {
          accel_profile = "flat";
          sensitivity = -0.3;
        };
      };

      monitor = [
        {
          output = "DP-1";
          mode = "1920x1080@165";
          position = "0x0";
          scale = 1;
        }
        {
          output = "HDMI-A-1";
          mode = "1920x1080@60";
          position = "1920x0";
          scale = 1;
        }
      ];

      workspace_rule = [
        {
          workspace = "1";
          monitor = "DP-1";
          default = true;
          persistent = true;
        }
        {
          workspace = "7";
          monitor = "HDMI-A-1";
          default = true;
          persistent = true;
        }
        {
          workspace = "8";
          monitor = "HDMI-A-1";
          persistent = true;
        }
        {
          workspace = "9";
          monitor = "HDMI-A-1";
          persistent = true;
        }
      ];

      window_rule = [
        {
          # すべてのアプリからの最大化リクエストを無視する
          name = "suppress-maximize-events";
          match = {
            class = ".*";
          };
          suppress_event = "maximize";
        }
        {
          # XWaylandでいくつかの問題を引き起こしている問題を修正
          name = "fix-xwayland-drags";
          match = {
            class = "^$";
            title = "^$";
            xwayland = true;
            float = true;
            fullscreen = false;
            pin = false;
          };
          no_focus = true;
        }
        {
          match = {
            class = "com.obsproject.Studio";
          };
          workspace = "8";
        }
        {
          match = {
            class = ".*Minecraft.*";
          };
          maximize = true;
        }
        {
          match = {
            class = ".*steam\_app\_.*";
          };
          confine_pointer = true;
        }
      ];
    };
  };
}
