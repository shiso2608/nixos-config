{ pkgs, ... }:

{
  environment.systemPackages = with pkgs; [
    ddcutil
  ];

  hardware.i2c.enable = true;

  services.udev.packages = with pkgs; [
    ddcutil
  ];
}
