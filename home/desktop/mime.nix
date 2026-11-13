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

      # フォールバック
      "x-scheme-handler/unknown" = [ "google-chrome.desktop" ];
    };
  };
}
