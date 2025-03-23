{ config, lib, pkgs, userSettings ... }:

{
  config = {
    # KVM & Libvirt
    virtualisation.libvirtd = {
      enable = true;
      qemu = {
        package = pkgs.qemu_kvm;
        runAsRoot = false;
      };
    };

    services.libvirtd.enable = true;

    # Kernelmodule für KVM aktivieren
    boot.kernelModules = [ "kvm" "kvm_amd" ]; # bei Intel: "kvm_intel"

    # Benutzerrechte
    users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];

    # Tools & UI
    environment.systemPackages = with pkgs; [
      virt-manager
      virt-viewer
      spice-gtk
      win-virtio
    ];

    # Udev-Regeln für USB-Passthrough
    services.udev.packages = [ pkgs.libvirt ];
  };
}

