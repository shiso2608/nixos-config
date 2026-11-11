{ ... }:

{
  xdg.mimeApps = {
    enable = true;

    defaultApplications = {
      # ウェブ
      "text/html" = [ "google-chrome.desktop" ];
      "x-scheme-handler/http" = [ "google-chrome.desktop" ];
      "x-scheme-handler/https" = [ "google-chrome.desktop" ];
      "x-scheme-handler/about" = [ "google-chrome.desktop" ];

      # メール
      "message/rfc822" = [ "thunderbird.desktop" ];

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
      "x-scheme-handler/unknown" = [ "google-chrome.desktop" ];
    };
  };
}
