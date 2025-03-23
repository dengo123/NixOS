{ config, lib, pkgs, userSettings, ... }:

{
  config = {
    # Libvirt/KVM aktivieren
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
      };
    };

    services.libvirtd.enable = true;
    boot.kernelModules = [ "kvm" "kvm_amd" "vfio" "vfio_pci" "vfio_iommu_type1" ];

    # IOMMU aktivieren (wichtig für VFIO)
    boot.kernelParams = [ "amd_iommu=on" ]; # bei Intel: "intel_iommu=on"

    # Optional: bestimmte Geräte für VFIO binden (Beispiel mit NVIDIA GPU)
    boot.extraModprobeConfig = ''
      options vfio-pci ids=10de:2204,10de:1aef
    '';

    # IDs per lspci -nn herausfinden!
    # z.B. lspci -nn | grep -i nvidia

    # Early Load der VFIO-Module
    boot.initrd.kernelModules = [ "vfio_pci" ];

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
  };
}

