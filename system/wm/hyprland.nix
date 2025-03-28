{ config, pkgs, userSettings, ... }:

{
  programs.hyprland = {
    enable = true;
  };

  services.desktomManager.sddm = {
    enable = true;
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    kitty
    grim
    slurp
    xdg-desktop-portal-hyprland
  ];
}

