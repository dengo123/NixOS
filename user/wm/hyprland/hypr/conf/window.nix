{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    general = {
      allow_tearing = false;
      resize_on_border = true;
      no_focus_fallback = false;
    };

    misc = {
      focus_on_activate = true;
    };

    input = {
      # Bei Fenstereintritt automatisch fokussieren (X11-like)
      follow_mouse = 1;
    };

    # Optional: Animation wenn Fenster erscheinen/verschwinden
    animations = {
      enabled = true;
    };
  };
}

