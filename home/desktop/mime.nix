{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # ウェブ
      "text/html" = [ "firefox.desktop" ];
      "x-scheme-handler/http" = [ "firefox.desktop" ];
      "x-scheme-handler/https" = [ "firefox.desktop" ];
      "x-scheme-handler/about" = [ "firefox.desktop" ];

      # 画像
      "image/jpeg" = [ "org.gnome.Loupe.desktop" ];
      "image/png" = [ "org.gnome.Loupe.desktop" ];
      "image/gif" = [ "org.gnome.Loupe.desktop" ];
      "image/webp" = [ "org.gnome.Loupe.desktop" ];
      "image/bmp" = [ "org.gnome.Loupe.desktop" ];

      # 動画
      "video/mp4" = [ "mpv.desktop" ];

      # 音楽
      "audio/mpeg" = [ "mpv.desktop" ];

      # フォールバック
      "x-scheme-handler/unknown" = [ "firefox.desktop" ];
    };
  };
}
