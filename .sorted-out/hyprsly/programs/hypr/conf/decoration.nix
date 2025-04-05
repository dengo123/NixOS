{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;
    };
  };
}

