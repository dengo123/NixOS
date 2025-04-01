{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "NIXOS_OZONE_WL,1"
      "XCURSOR_SIZE,24"
      "QT_QPA_PLATFORM,wayland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "WLR_NO_HARDWARE_CURSORS,1"
    ];
  };
}

