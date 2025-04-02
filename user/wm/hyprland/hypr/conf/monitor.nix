{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    monitor = [
      # Linker Monitor: DP-2
      "DP-2,1920x1080@60,0x0,1"
      # Rechter Monitor: DP-3, rechts neben DP-2
      "DP-3,1920x1080@60,1920x0,1"
    ];
  };
}

