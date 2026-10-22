{ ... }:

{
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  environment.sessionVariables = {
    LIBVA_DRIVER_NAME = "radeonsi";
    VDPAU_DRIVER = "radeonsi";
  };

  hardware.amdgpu.overdrive.enable = true;
  services.lact.enable = true;
}
