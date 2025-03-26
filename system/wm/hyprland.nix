{ config, pkgs, userSettings, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session = {
      command = "tuigreet --cmd Hyprland";
    };
  };

  security.pam.services.hyprlock = {};

  environment.systemPackages = with pkgs; [
    tuigreet
    wl-clipboard
    kitty
    grim
    slurp
    xdg-desktop-portal-hyprland
  ];
}

