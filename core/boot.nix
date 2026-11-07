{ pkgs, ... }:

{
  boot = {
    loader = {
      efi.canTouchEfiVariables = true;
      systemd-boot.enable = false;

      grub = {
        enable = true;
        device = "nodev";
        useOSProber = true;
        efiSupport = true;
        # blkid による検出の代わりに指定された UUID を使用する (btrfs のサブボリュームで必要)
        fsIdentifier = "provided";
      };
    };

    tmp.cleanOnBoot = true;
    kernelPackages = pkgs.linuxPackages_latest;
  };

  environment.systemPackages = with pkgs; [
    efibootmgr
  ];
}
