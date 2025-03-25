{ pkgs, ... }:

{
  home.packages = [ pkgs.hyprlock ];

  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, L, exec, ${pkgs.hyprlock}/bin/hyprlock"
  ];

  xdg.configFile."hypr/hyprlock.conf".text = ''
  background_color=${config.stylix.colors.base00}
  ring_color=${config.stylix.colors.accent}
  text_color=${config.stylix.colors.base05}
  fail_color=#ff5555
'';
}

