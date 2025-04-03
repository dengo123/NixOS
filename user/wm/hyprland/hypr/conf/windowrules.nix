{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # 🟦 gsimplecal (Kalender)
    "float, class:gsimplecal"
    "center, class:gsimplecal"

    # 🔊 pavucontrol (Lautstärkeregelung)
    "float, class:pavucontrol"
    "center, class:pavucontrol"

    # 🔵 blueman-manager (Bluetooth)
    "float, class:blueman-manager"
    "center, class:blueman-manager"

    # 🌐 nm-connection-editor (Netzwerkverwaltung)
    "float, class:nm-connection-editor"
    "center, class:nm-connection-editor"

    # ➗ gnome-calculator
    "float, class:gnome-calculator"
    "center, class:gnome-calculator"
  ];
}

