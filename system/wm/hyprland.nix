{ config, pkgs, userSettings, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  security.pam.services.hyprlock = {};

  environment.systemPackages = with pkgs; [
    wl-clipboard
    kitty
    grim
    slurp
    xdg-desktop-portal-hyprland
  ];
}

