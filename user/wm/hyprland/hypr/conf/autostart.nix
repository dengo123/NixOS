{ config, lib, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    # Wichtige Env-Aktualisierung
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    # UI-Komponenten
    "dunst"
    
    # Idle-Daemon (für hyprlock)
    "hypridle"
  ];
}

