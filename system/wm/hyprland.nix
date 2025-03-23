{ config, pkgs, ... }:

{
  # Display Manager
  services.displayManager.sddm.enable = true;
  services.displayManager.defaultSession = "hyprland";

  # Hyprland systemseitig aktivieren
  programs.hyprland.enable = true;

  # Stylix übernimmt das theming
  stylix.targets.hyprland.enable = true;
  stylix.targets.sddm.enable = true;

  environment.systemPackages = with pkgs; [
    sddm
    xwayland
    wl-clipboard
    grim slurp # für Screenshots
    xdg-desktop-portal-hyprland
  ];

  # Hostseitig kann zusätzlich folgendes gesetzt werden (optional):
  security.pam.services.sddm.enableKwallet = true;
}

