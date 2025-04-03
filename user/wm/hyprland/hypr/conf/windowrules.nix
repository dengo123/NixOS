{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # 🟦 gsimplecal (Kalender)
    "float, class:gsimplecal"
    "center, class:gsimplecal"

    # 🔊 pavucontrol (Lautstärkeregelung)
    "float, class:org.pulseaudio.pavucontrol"
    "center, class:org.pulseaudio.pavucontrol"

    # 🔵 blueman-manager (Bluetooth)
    "float, title:Bluetooth Devices"
    "center, title:Bluetooth Devices"

    # 🌐 nm-connection-editor (Netzwerkverwaltung)
    "float, class:nm-connection-editor"
    "center, class:nm-connection-editor"

    # ➗ gnome-calculator
    "float, class:gnome-calculator"
    "center, class:gnome-calculator"
  ];
}

