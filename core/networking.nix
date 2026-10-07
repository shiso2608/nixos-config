{ ... }:

{
  networking = {
    hostName = "nixos";
    networkmanager.enable = true;
  };

  services.openssh.enable = true;
}
