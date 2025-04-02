{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    misc = {
      # Cursor-Verhalten
      no_cursor_warps = true;
      disable_hardware_cursors = true;

      # Fokusverhalten & Sperren
      idle_inhibit = true;
      focus_on_activate = true;

      # Splash / Logo
      disable_hyprland_logo = true;
      disable_splash_rendering = true;

      # Initiales Workspace-Tracking (damit aktuelle Monitore erhalten bleiben)
      initial_workspace_tracking = true;

      # Verhalten bei Floating-Fenstern
      always_show_floating = true;
    };
  };
}

