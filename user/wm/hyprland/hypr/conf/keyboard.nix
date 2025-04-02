{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    input = {
      kb_layout = "us";
      kb_variant = "altgr-intl"; # ermöglicht AltGr-Layer für Euro-Zeichen etc.
      numlock_by_default = true;

      follow_mouse = 1;
      natural_scroll = true;
      touchpad = {
        natural_scroll = true;
      };
    };
  };
}

