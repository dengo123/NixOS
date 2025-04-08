{ config, lib, pkgs, userSettings, ... }:

{
  imports = [
    ../../system/app/hyprland.nix     # oder wo dein Hyprland-Modul liegt
    ../../user/profiles/hyprnix.nix   # dein User-WM-Profil (wenn vorhanden)
  ];

  networking.hostName = "hyprnix-vm";

  boot.loader.grub = {
    enable = true;
    efiSupport = true;
    device = "nodev";  # für UEFI-Images
    useOSProber = false;
  };

  boot.loader.efi.canTouchEfiVariables = true;

  time.timeZone = "Europe/Berlin";
  i18n.defaultLocale = "en_US.UTF-8";

  users.users.${userSettings.username} = {
    isNormalUser = true;
    extraGroups = [ "wheel" "networkmanager" ];
    initialPassword = "nixos"; # nur für Testzwecke
  };

  # Wayland mit Hyprland only
  programs.hyprland.enable = true;

  # Netzwerk
  networking.networkmanager.enable = true;

  # optional: SSH für Zugriff aus Host
  services.openssh.enable = true;

  # Mehr Builds in der VM zulassen
  nix.settings.max-jobs = lib.mkDefault 4;

  # Splash oder GRUB-Theming kannst du direkt hier testen
  # z. B. später: boot.loader.grub.splashImage = ./splash.png;
}

