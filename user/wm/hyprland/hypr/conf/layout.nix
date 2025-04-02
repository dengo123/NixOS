{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;     # Abstand zwischen Fenstern
      gaps_out = 10;   # Abstand zu Bildschirmrändern
      border_size = 2; # Fensterrahmen

      col.active_border = "rgba(88c0d088)";
      col.inactive_border = "rgba(88888888)";

      layout = "dwindle"; # Alternativ: master, tiling
    };

    dwindle = {
      pseudotile = true;   # Fenster behalten ihre Größe beim Floaten
      preserve_split = true;
    };

    master = {
      new_is_master = false;
    };
  };
}

