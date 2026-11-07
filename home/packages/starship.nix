{ ... }:

{
  programs.starship = {
    enable = true;

    presets = [
      "catppuccin-powerline"
    ];

    settings = {
      line_break = {
        disabled = false;
      };

      cmd_duration = {
        show_notifications = false;
      };
    };
  };
}
