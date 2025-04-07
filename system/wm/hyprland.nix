{ config, pkgs, userSettings, ... }:

{
  programs.hyprland = {
    enable = true;
    withUWSM = true;
  };

  services.displayManager = {
    sddm = {
      enable = true;
      wayland.enable = true;
    };
    defaultSession = "hyprland-uwsm";
  };

  environment.systemPackages = with pkgs; [
    wl-clipboard
    kitty
    grim
    slurp
    xdg-desktop-portal-hyprland
  ];
}

