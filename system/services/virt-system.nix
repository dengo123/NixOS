{ config, lib, pkgs, userSettings, ... }:

{
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

