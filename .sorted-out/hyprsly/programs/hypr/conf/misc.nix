{ config, lib, pkgs, ... }:

{
  wayland.windowManager.hyprland.settings = {
    misc = {
      # Fokusverhalten & Sperren
      focus_on_activate = true;

      # Splash / Logo
      disable_hyprland_logo = true;
      disable_splash_rendering = true;

      # Initiales Workspace-Tracking (damit aktuelle Monitore erhalten bleiben)
      initial_workspace_tracking = true;
    };
  };
}

