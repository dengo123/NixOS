{ config, lib, pkgs, ... }:

{
  home.packages = with pkgs; [
    hyprland
    waybar
    rofi
    dunst
    wlogout
    pavucontrol
    blueman
    networkmanagerapplet
    blueberry
    brightnessctl
    playerctl
    gsimplecal
    jq
  ];

  home.file = {
    ".config/hypr" = {
      source = ./hypr;
      recursive = true;
    };
    ".config/waybar" = {
      source = ./waybar;
      recursive = true;
    };
    ".config/rofi" = {
      source = ./rofi;
      recursive = true;
    };
    ".config/dunst" = {
      source = ./dunst;
      recursive = true;
    };
  };

  wayland.windowManager.hyprland.enable = true;
}

