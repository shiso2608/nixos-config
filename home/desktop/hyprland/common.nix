{ lib, ... }:

{
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
}
