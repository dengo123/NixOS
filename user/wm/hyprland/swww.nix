{ pkgs, config, ... }:

{
  home.packages = [ pkgs.swww ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon"
    "swww img"  # benutzt Stylix-Wallpaper direkt
  ];

}

