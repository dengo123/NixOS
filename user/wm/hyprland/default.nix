{ config, lib, pkgs, userSettings, ... }:

let
  autostart = import ./autostart.nix { inherit pkgs; };
  keybindings = import ./keybindings.nix { inherit pkgs userSettings; };
  settings = import ./settings.nix { inherit config pkgs userSettings; };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = settings // {
      bind = keybindings;
      exec-once = autostart.exec-once;
    };
  };

  stylix.targets.hyprland.enable = true;

  # home.packages für Autostart-Tools
  inherit (autostart) home.packages;
}

