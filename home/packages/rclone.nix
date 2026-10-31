{ config, ... }:

{
  programs.rclone.enable = true;

  home.file."${config.xdg.configHome}/rclone/backup-list" = {
    text = ''
      Documents/**
      Music/**
      Pictures/**
      Projects/**
      Videos/**
      .config/age/**
    '';
  };

  home.shellAliases = {
    backup-run = "rclone sync ~ /run/media/user/BackupDrive/backup --include-from ${config.xdg.configHome}/rclone/backup-list --progress";
  };
}
