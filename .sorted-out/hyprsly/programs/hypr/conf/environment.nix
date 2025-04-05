{ config, lib, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland.settings = {
    env = [
      "NIXOS_OZONE_WL,1"
      "XCURSOR_THEME,${userSettings.cursor}"
      "XCURSOR_SIZE,${builtins.toString userSettings.cursorSize}"
      "QT_QPA_PLATFORM,wayland"
      "QT_WAYLAND_DISABLE_WINDOWDECORATION,1"
      "WLR_NO_HARDWARE_CURSORS,1"
    ];
  };
}

