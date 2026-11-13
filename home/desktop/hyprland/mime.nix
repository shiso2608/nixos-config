{ ... }:

{
  xdg.mimeApps = {
    defaultApplications = {
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
    };
  };
}
