{ config, lib, pkgs, userSettings, ... }:

{
  wayland.windowManager.hyprland.settings.exec-once = [
    # Wichtige Env-Aktualisierung
    "dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP"

    # UI-Komponenten
    "waybar"
    "dunst"
    "wlogout"

    # Hintergrundbild mit swww (stylix-kompatibel)
    "swww init && swww img ${../../themes/${userSettings.theme}/background.png}"

    # App Launcher (optional, nur wenn du rofi nutzt)
    "rofi -show drun"

    # Idle-Daemon (für hyprlock)
    "hypridle"
  ];
}

