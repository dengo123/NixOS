{ pkgs, config, ... }:

{
  home.packages = [ pkgs.dunst ];

  wayland.windowManager.hyprland.settings.exec-once = [ "dunst" ];

  xdg.configFile."dunst/dunstrc".text = ''
    [global]
    font = ${config.stylix.fonts.monospace.name} 11
    frame_color = "${config.stylix.colors.accent}"
    separator_color = "auto"
    background = "${config.stylix.colors.base00}"
    foreground = "${config.stylix.colors.base05}"
    corner_radius = 8
    padding = 8
    horizontal_padding = 10
    frame_width = 2
  '';
}

