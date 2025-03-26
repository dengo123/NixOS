{ pkgs, config, ... }:

{
  home.packages = [ pkgs.wofi ];

  xdg.configFile."wofi/style.css".text = ''
    * {
      font-size: 13px;
    }

    #entry {
      border-radius: 8px;
    }
  '';

  wayland.windowManager.hyprland.settings.bind = [
    "SUPER, D, exec, ${pkgs.wofi}/bin/wofi --show drun"
  ];
}

