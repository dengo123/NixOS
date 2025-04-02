{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    decoration = {
      rounding = 10;
      drop_shadow = true;
      shadow_range = 4;
      shadow_render_power = 3;
      "col.shadow" = "rgba(00000099)";
    };

    animations = {
      enabled = true;

      bezier = [
        "easein, 0.36, 0, 1, 1"
        "easeout, 0, 0, 0.32, 1"
        "easeinout, 0.36, 0, 0.32, 1"
      ];

      animation = [
        "windows, 1, 4, easeout"
        "windowsOut, 1, 4, easein"
        "windowsMove, 1, 4, easeout"
        "fade, 1, 4, easeinout"
        "workspaces, 1, 4, easeinout"
      ];
    };

    blur = {
      enabled = true;
      size = 8;
      passes = 3;
      new_optimizations = true;
    };
  };
}

