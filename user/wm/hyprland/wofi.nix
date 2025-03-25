{ pkgs, config, ... }:

{
  home.packages = [ pkgs.wofi ];

  xdg.configFile."wofi/style.css".text = ''
    * {
      font-family: ${config.stylix.fonts.monospace.name}, sans-serif;
      font-size: 13px;
      color: ${config.stylix.colors.base05};
      background: ${config.stylix.colors.base00};
    }

    #entry {
      border: 2px solid ${config.stylix.colors.accent};
      border-radius: 8px;
    }
  '';

  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, D, exec, ${pkgs.wofi}/bin/wofi --show drun"
  ];
}

