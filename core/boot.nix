{ pkgs, ... }:

{
  boot = {
    loader.grub = {
      enable = true;
      device = "/dev/vda";
      useOSProber = true;
      # blkid による検出の代わりに指定された UUID を使用する (btrfs のサブボリュームで必要)
      fsIdentifier = "provided";
    };

    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };
}
