{ pkgs, ... }:

{
  home.packages = [ pkgs.hyprlock ];

  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
  ];

}

