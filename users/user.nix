{ pkgs, ... }:

{
  # `passwd` でパスワードを設定するのを忘れないでください。
  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [
      "networkmanager"
      "wheel"
      "i2c"
    ];
    shell = pkgs.zsh;
  };
}
