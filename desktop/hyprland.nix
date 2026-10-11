{ pkgs, ... }:

{
  # ディスプレイマネージャー
  services.greetd = {
    enable = true;
    useTextGreeter = true;

    settings = {
      default_session = {
        user = "greeter";
        command = "${pkgs.tuigreet}/bin/tuigreet --remember --cmd 'uwsm start hyprland.desktop'";
      };
    };
  };

  # ウィンドウマネージャー
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # 画面共有を有効化
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ xdg-desktop-portal-hyprland ];
  };
}
