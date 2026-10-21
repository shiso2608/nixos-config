{ lib }:

let
  # ウィンドウフォーカステンプレート
  mkFocusBind =
    keys: direction:
    map (key: {
      _args = [
        (lib.generators.mkLuaInline "mod .. \" + ${key}\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({ direction = \"${direction}\" })")
      ];
    }) keys;
  # ウィンドウ移動テンプレート
  mkMoveBind =
    keys: direction:
    map (key: {
      _args = [
        (lib.generators.mkLuaInline "mod .. \" + CTRL + ${key}\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({ direction = \"${direction}\" })")
      ];
    }) keys;
  # ワークスペースフォーカス移動テンプレート
  mkWorkspaceFocusBind =
    keys:
    map (key: {
      _args = [
        (lib.generators.mkLuaInline "mod .. \" + ${key}\"")
        (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"${key}\" })")
      ];
    }) keys;
  # ウィンドウをワークスペースへ移動させるテンプレート
  mkWindowToWorkspaceBind =
    keys:
    map (key: {
      _args = [
        (lib.generators.mkLuaInline "mod .. \" + SHIFT + ${key}\"")
        (lib.generators.mkLuaInline "hl.dsp.window.move({ workspace = \"${key}\" })")
      ];
    }) keys;
  # OBS Studioのホットキーテンプレート (pass() が動作するようになったら有効化する)
  # mkObsBind =
  #   keys:
  #   map (key: {
  #     _args = [
  #       (lib.generators.mkLuaInline "\"CTRL + SHIFT + ${key}\"")
  #       (lib.generators.mkLuaInline "hl.dsp.pass({ window = \"com.obsproject.Studio\"})")
  #     ];
  #   }) keys;
in
[
  # ターミナル起動
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + Q\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"ghostty\")")
    ];
  }
  # ランチャー起動
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + R\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg panel-toggle launcher\")")
    ];
  }
  # セッションパネル
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + M\"")
      (lib.generators.mkLuaInline ''
        function()
          hl.dispatch(hl.dsp.focus({ monitor = "DP-1" }))
          hl.dispatch(hl.dsp.exec_cmd("noctalia msg panel-toggle session"))
        end
      '')
    ];
  }
  # スクリーンショット
  {
    # 全体
    _args = [
      (lib.generators.mkLuaInline "\"PRINT\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg screenshot-fullscreen\")")
    ];
  }
  {
    # 矩形選択
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + PRINT\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg screenshot-region\")")
    ];
  }
  # OBS Studio (obs-cmd を使用して wayland の問題を回避)
  {
    # スクリーンショット
    _args = [
      (lib.generators.mkLuaInline "\"CTRL + SHIFT + F9\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"obs-cmd save-screenshot 'Source' png \\\"\" .. home .. \"/Pictures/Screenshots/$(date +%Y%m%d-%H%M%S).png\\\"\")")
    ];
  }
  {
    # 録画開始・停止
    _args = [
      (lib.generators.mkLuaInline "\"CTRL + SHIFT + F10\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"obs-cmd recording toggle\")")
    ];
  }
  {
    # リプレイバッファ保存
    _args = [
      (lib.generators.mkLuaInline "\"CTRL + SHIFT + F11\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"obs-cmd replay save\")")
    ];
  }
  # ウィンドウを閉じる
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + C\"")
      (lib.generators.mkLuaInline "hl.dsp.window.close()")
    ];
  }
  # フルスクリーン
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + F\"")
      (lib.generators.mkLuaInline "hl.dsp.window.fullscreen({ mode = \"maximized\", action = \"toggle\" })")
    ];
  }
  # フロート
  {
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + V\"")
      (lib.generators.mkLuaInline "hl.dsp.window.float({ action = \"toggle\" })")
    ];
  }
  # ワークスペースの移動
  {
    # 前へ
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + page_up\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e-1\" })")
    ];
  }
  {
    # 次へ
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + page_down\"")
      (lib.generators.mkLuaInline "hl.dsp.focus({ workspace = \"e+1\" })")
    ];
  }
  # ウィンドウのサイズ変更
  {
    # 左へ拡大・縮小
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + ALT + LEFT\"")
      (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = -10, y = 0, relative = true })")
      { repeating = true; }
    ];
  }
  {
    # 右へ拡大・縮小
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + ALT + RIGHT\"")
      (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 10, y = 0, relative = true })")
      { repeating = true; }
    ];
  }
  {
    # 上へ拡大・縮小
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + ALT + UP\"")
      (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = -10, relative = true })")
      { repeating = true; }
    ];
  }
  {
    # 下へ拡大・縮小
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + ALT + DOWN\"")
      (lib.generators.mkLuaInline "hl.dsp.window.resize({ x = 0, y = 10, relative = true })")
      { repeating = true; }
    ];
  }
  # 音量調整
  {
    # アップ
    _args = [
      "XF86AudioRaiseVolume"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg volume-up 1\")")
      {
        repeating = true;
        locked = true;
      }
    ];
  }
  {
    # ダウン
    _args = [
      "XF86AudioLowerVolume"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg volume-down 1\")")
      {
        repeating = true;
        locked = true;
      }
    ];
  }
  {
    # ミュート
    _args = [
      "XF86AudioMute"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg volume-mute\")")
      { locked = true; }
    ];
  }
  # メディアコントロール
  {
    # 前へ
    _args = [
      "XF86AudioPrev"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg media previous\")")
      { locked = true; }
    ];
  }
  {
    # 再生・一時停止
    _args = [
      "XF86AudioPlay"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg media toggle\")")
      { locked = true; }
    ];
  }
  {
    # 停止
    _args = [
      "XF86AudioStop"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg media stop\")")
      { locked = true; }
    ];
  }
  {
    # 次へ
    _args = [
      "XF86AudioNext"
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg media next\")")
      { locked = true; }
    ];
  }
  # 輝度調整
  {
    # アップ
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + F9\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg brightness-up all 1%\")")
      {
        repeating = true;
        locked = true;
      }
    ];
  }
  {
    # ダウン
    _args = [
      (lib.generators.mkLuaInline "mod .. \" + F10\"")
      (lib.generators.mkLuaInline "hl.dsp.exec_cmd(\"noctalia msg brightness-down all 1%\")")
      {
        repeating = true;
        locked = true;
      }
    ];
  }
]
# ウィンドウフォーカス
++ (mkFocusBind [ "H" "LEFT" ] "left")
++ (mkFocusBind [ "L" "RIGHT" ] "right")
++ (mkFocusBind [ "K" "UP" ] "up")
++ (mkFocusBind [ "J" "DOWN" ] "down")
# ウィンドウ移動
++ (mkMoveBind [ "H" "LEFT" ] "left")
++ (mkMoveBind [ "L" "RIGHT" ] "right")
++ (mkMoveBind [ "K" "UP" ] "up")
++ (mkMoveBind [ "J" "DOWN" ] "down")
# ワークスペースフォーカス移動 (1-9)
++ (mkWorkspaceFocusBind [
  "1"
  "2"
  "3"
  "4"
  "5"
  "6"
  "7"
  "8"
  "9"
])
# アクティブウィンドウをワークスペースへ移動 (1-9)
++ (mkWindowToWorkspaceBind [
  "1"
  "2"
  "3"
  "4"
  "5"
  "6"
  "7"
  "8"
  "9"
])
# OBS Studio
# ++ (mkObsBind [
#   "F9"
#   "F10"
#   "F11"
# ])
