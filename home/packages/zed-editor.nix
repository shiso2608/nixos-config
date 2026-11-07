{ ... }:

{
  programs.zed-editor = {
    enable = true;

    extensions = [
      "nix"
    ];

    userSettings = {
      restore_on_startup = "launchpad";
      helix_mode = true;

      project_panel = {
        dock = "left";
      };

      languages = {
        Nix = {
          language_servers = [ "nixd" ];
        };
      };

      diagnostics = {
        inline = {
          enabled = true;
        };
      };

      buffer_font_family = "JetBrainsMono Nerd Font";
      buffer_font_fallbacks = [
        "Noto Sans Mono CJK JP"
      ];

      ui_font_family = "JetBrainsMono Nerd Font";
      ui_font_fallbacks = [
        "Noto Sans Mono CJK JP"
      ];

      terminal = {
        font_family = "JetBrainsMono Nerd Font";
        font_fallbacks = [
          "Noto Sans Mono CJK JP"
        ];
      };
    };
  };
}
