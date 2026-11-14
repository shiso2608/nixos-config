{ pkgs, ... }:

{
  catppuccin = {
    enable = true;
    autoEnable = true;
    flavor = "mocha";
    accent = "peach";

    cursors.enable = true;
    starship.enable = false;
  };
}
