{ pkgs, ... }:

{
  programs.btop = {
    enable = true;
    package = pkgs.btop-rocm;

    settings = {
      shown_boxes = "cpu mem net proc gpu0";
    };
  };
}
