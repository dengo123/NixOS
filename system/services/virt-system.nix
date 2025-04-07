{ config, lib, pkgs, userSettings, ... }:

{
  # Aktiviert libvirtd und QEMU mit KVM
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = false;
    };
  };

  # Dauerhafte Aktivierung beim Boot, aber GRUB-safe (kein onBoot!)
  systemd.services.libvirtd = {
    wantedBy = [ "multi-user.target" ];  # Startet libvirtd beim Boot
    restartIfChanged = lib.mkForce true;
    restartTriggers = [ config.virtualisation.libvirtd.qemu.package ];
  };

  # Socket-aktiviert, z. B. für virsh oder virt-manager
  systemd.sockets.libvirtd.enable = true;

  # Deaktiviert libvirt-guests → keine Shutdown-Hänger
  systemd.services."libvirt-guests".enable = false;

  # Benutzer in libvirt- und kvm-Gruppen
  users.users.${userSettings.username}.extraGroups = [ "libvirtd" "kvm" ];

  # Systemweite Tools
  environment.systemPackages = with pkgs; [
    # Virtualisierung: Basis
    qemu_kvm
    libvirt

    # SPICE + VNC GUI-Support
    virt-viewer
    spice-gtk
    gtk-vnc

    # CLI-Tools
    virt-top         # Ressourcenüberwachung
    virt-xml         # VM-Konfig anpassen

    # Diagnose-Tools
    dmidecode
    pciutils
    usbutils

    # Windows-VM Support
    win-virtio

    # Optionale GTK-GUI für VMs
    virt-manager
  ];

  # Udev-Regeln für libvirt (z. B. USB Passthrough)
  services.udev.packages = [ pkgs.libvirt ];
}

