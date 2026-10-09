{ pkgs, ... }:

{
  # `passwd` でパスワードを設定するのを忘れないでください。
  users.users."user" = {
    isNormalUser = true;
    description = "user";
    extraGroups = [ "networkmanager" "wheel" ];
    shell = pkgs.zsh;
  };

  # デフォルトシェルを指定するために必要
  programs.zsh.enable = true;
}
