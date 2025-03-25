{ config, pkgs, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  # Auto-Login für deinen User via tty1
  services.getty.autoLogin.enable = true;
  services.getty.autoLogin.user = userSettings.username

  security.pam.services.hyprlock = {};

  environment.systemPackages = with pkgs; [
    wl-clipboard
    kitty
    grim
    slurp
    xdg-desktop-portal-hyprland
  ];
}

