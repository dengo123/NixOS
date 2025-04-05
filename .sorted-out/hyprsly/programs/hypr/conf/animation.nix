{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    animations = {
      enabled = true;

      bezier = [
        "overshot, 0.13, 0.99, 0.29, 1.1"
        "easeinoutsine, 0.37, 0, 0.63, 1"
      ];

      animation = [
        "windows, 1, 5, overshot, slide"
        "windowsOut, 1, 4, default, popin 80%"
        "border, 1, 10, default"
        "fade, 1, 10, default"
        "workspaces, 1, 6, easeinoutsine, slide"
      ];
    };
  };
}

