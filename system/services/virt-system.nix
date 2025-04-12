{ config, lib, pkgs, userSettings, ... }:

{
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
    };
  };

  systemd.services.libvirtd = {
    wantedBy = [ "multi-user.target" ];
    restartIfChanged = lib.mkForce true;
    restartTriggers = [ config.virtualisation.libvirtd.qemu.package ];
  };

  systemd.sockets.libvirtd.enable = true;

  systemd.services."libvirt-guests".enable = false;

  users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];

  environment.systemPackages = with pkgs; [
    qemu_kvm
    libvirt

    virt-viewer
    spice-gtk
    gtk-vnc

    virt-top

    dmidecode
    pciutils
    usbutils

    win-virtio

    virt-manager
  ];

  services.udev.packages = [ pkgs.libvirt ];
}

