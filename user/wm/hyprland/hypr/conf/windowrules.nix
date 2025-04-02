{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings.windowrule = [
    # Wlogout zentrieren und floating
    "float, ^(wlogout)$"
    "center, ^(wlogout)$"

    # Pavucontrol
    "float, ^(pavucontrol)$"
    "center, ^(pavucontrol)$"

    # Bluetooth Manager
    "float, ^(blueman-manager)$"
    "center, ^(blueman-manager)$"

    # Network Manager GUI
    "float, ^(nm-connection-editor)$"
    "center, ^(nm-connection-editor)$"

    # Optional: andere CLI-basierte Tools wie nmtui nicht nötig
  ];
}

