{ pkgs, ... }:

{
  xdg = {
    enable = true;
    localBinInPath = true;
  };

  home.file.".local/bin/bright" = {
    executable = true;

    text = ''
      #!/usr/bin/env bash
      percent="$1"

      if [[ -z "$percent" ]] || ! [[ "$percent" =~ ^[0-9]+$ ]] || (( percent < 0 || percent > 100 )); then
          echo "使用方法: bright <0-100>"
          exit 1
      fi

      val1=$(( percent * 50 / 100 ))
      val2=$percent

      echo "明るさを $percent% に設定中... (Disp1: $val1/50, Disp2: $val2/100)"

      ${pkgs.ddcutil}/bin/ddcutil --display 1 setvcp 10 "$val1" >/dev/null 2>&1 &
      ${pkgs.ddcutil}/bin/ddcutil --display 2 setvcp 10 "$val2" >/dev/null 2>&1 &
      wait

      echo "設定が完了しました。"
    '';
  };
}
