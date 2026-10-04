{ pkgs, ... }:

{
  boot = {
    # Use the GRUB 2 boot loader.
    loader.grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
      # Use provided UUIDs instead of blkid probing (required for btrfs subvolumes)
      fsIdentifier = "provided";
    };

    # Use latest kernel.
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
