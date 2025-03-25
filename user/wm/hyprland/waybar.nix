{ pkgs, ... }:

{
  home.packages = [ pkgs.waybar ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
  ];
}

