{ config, lib, ... }:

{
  wayland.windowManager.hyprland.settings.windowrulev2 = [
    # 🟦 wlogout: Power-Menü
    "float, ^wlogout$"
    "center, ^wlogout$"
    "noblur, ^wlogout$"

    # 🟡 gsimplecal: Kalender-App
    "float, ^gsimplecal$"
    "center, ^gsimplecal$"
    "noblur, ^gsimplecal$"

    # 🔵 pavucontrol: Audio-Manager
    "float, ^pavucontrol$"
    "center, ^pavucontrol$"

    # 🟢 blueman-manager: Bluetooth
    "float, ^blueman-manager$"
    "center, ^blueman-manager$"

    # 🟣 nm-connection-editor: Netzwerkverwaltung
    "float, ^nm-connection-editor$"
    "center, ^nm-connection-editor$"

    # 🔘 gnome-calculator (Taschenrechner)
    "float, ^gnome-calculator$"
    "center, ^gnome-calculator$"

    # 🔶 thunderbird: E-Mail-Client
    "workspace special:mail silent, ^thunderbird$"

    # 🧪 btop (Terminal-App, aber zentrierbar bei Bedarf)
    "float, ^btop$"
    "center, ^btop$"

    # Optional: alle Dialoge standardmäßig floaten
    "float, title:^(.*Dialog.*)$"
  ];
}

