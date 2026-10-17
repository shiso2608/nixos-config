{ config, ... }:

{
  programs.rclone.enable = true;

  home.file."${config.xdg.configHome}/rclone/backup-list" = {
    text = ''
      Documents/**
      Music/**
      Pictures/**
      Projects/**
      RustTheBook/**
      Videos/**
      .config/age/**
      .sec/**
      .local/share/PrismLauncher/instances/26.1.2/minecraft/saves/**
      .local/share/PrismLauncher/instances/FTB Skies 2/.minecraft/saves/**
    '';
  };

  home.shellAliases = {
    backup-run = "rclone sync ~ /run/media/user/BackupDrive/backup --include-from ${config.xdg.configHome}/rclone/backup-list --progress";
  };
}
