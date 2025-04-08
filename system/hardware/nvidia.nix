{ config, lib, pkgs, ... }:

{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.beta;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    kernelParams = [ "nvidia_drm.modeset=1" "nvidia.NVreg_PreserveVideoMemoryAllocations=1" ];
    extraModprobeConfig = ''
      options nvidia_drm modeset=1
    '';
  };
}

