{ config, lib, pkgs, userSettings, ... }:

{
  # Kernelmodule und VFIO aktivieren
  boot = {
    kernelModules = [ "kvm" "kvm_amd" "vfio" "vfio_pci" "vfio_iommu_type1" ];
    initrd.kernelModules = [ "vfio_pci" ];
    extraModprobeConfig = ''
      options vfio-pci ids=10de:2204,10de:1aef
    '';
    kernelParams = [ "amd_iommu=on" ]; # Bei Intel: "intel_iommu=on"
  };

  # Libvirt aktivieren
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
    };
  };

  users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];

  environment.systemPackages = with pkgs; [
    virt-manager
    virt-viewer
    spice-gtk
    win-virtio
    dmidecode
    pciutils
  ];

  services.udev.packages = [ pkgs.libvirt ];
}

