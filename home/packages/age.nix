{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    age
  ];

  home.shellAliases = {
    age-bit = "age -d -i ${config.xdg.configHome}/age/key.txt ${config.home.homeDirectory}/Documents/confidential/bitwarden.age | less";
    age-pass = "age -d -i ${config.xdg.configHome}/age/key.txt ${config.home.homeDirectory}/Documents/confidential/passphrase.age | less";
  };
}
