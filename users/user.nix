{ pkgs, ... }:

{
  # `passwd` でパスワードを設定するのを忘れないでください。
  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
    ];
  };
}
