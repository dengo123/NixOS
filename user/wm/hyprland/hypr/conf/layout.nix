{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      gaps_in = 5;     # Abstand zwischen Fenstern
      gaps_out = 10;   # Abstand zu Bildschirmrändern
      border_size = 2; # Fensterrahmen

      layout = "dwindle"; # Alternativ: master, tiling
    };

    dwindle = {
      pseudotile = true;   # Fenster behalten ihre Größe beim Floaten
      preserve_split = true;
    };
  };
}

