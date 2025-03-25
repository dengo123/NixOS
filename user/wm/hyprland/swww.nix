{ pkgs, config, ... }:

{
  home.packages = [ pkgs.swww ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "swww-daemon"
    "swww img ${config.stylix.image}" # benutzt Stylix-Wallpaper direkt
  ];

  stylix.targets.swww.enable = true;
}

