{ config, lib, pkgs, ... }:

{
  hardware = {
    graphics.enable = true;

    nvidia = {
      open = true;
      package = config.boot.kernelPackages.nvidiaPackages.production;
      nvidiaSettings = true;
      modesetting.enable = true;
      powerManagement.enable = true;
      powerManagement.finegrained = true;
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];

  boot = {
    kernelModules = [ "nvidia" "nvidia_modeset" "nvidia_uvm" "nvidia_drm" ];
    kernelParams = [ "nvidia_drm.modeset=1" ];
    extraModprobeConfig = ''
      options nvidia-drm modeset=1
    '';
  };

  environment.sessionVariables = {
    __GLX_VENDOR_LIBRARY_NAME = "nvidia";
    GBM_BACKEND = "nvidia-drm";
    LIBVA_DRIVER_NAME = "nvidia";
    WLR_NO_HARDWARE_CURSORS = "1"; # optional, behebt Cursorprobleme bei Wayland
  };

  systemd.services.nvidia-resume = {
    description = "Rebind NVIDIA GPU on resume";
    after = [ "suspend.target" "hibernate.target" ];
    wantedBy = [ "suspend.target" "hibernate.target" ];
    serviceConfig = {
      Type = "oneshot";
      ExecStart = "${pkgs.writeShellScript "nvidia-resume.sh" ''
        set -e
        echo 1 > /sys/bus/pci/devices/0000:01:00.0/remove
        sleep 1
        echo 1 > /sys/bus/pci/rescan
        modprobe nvidia
        modprobe nvidia_uvm
        modprobe nvidia_drm
      ''}";
    };
  };
}

