{ pkgs, config, ... }:

{
  home.packages = [ pkgs.dunst ];

  wayland.windowManager.hyprland.settings.exec-once = [ "dunst" ];

  xdg.configFile."dunst/dunstrc".text = ''
    [global]
    separator_color = "auto"
    corner_radius = 8
    padding = 8
    horizontal_padding = 10
    frame_width = 2
  '';
}

