{ config, pkgs, userSettings, ... }:

let
  keybindings = import ./keybindings.nix { inherit pkgs userSettings; };
  settings = import ./settings.nix { inherit config pkgs userSettings; };
in {
  wayland.windowManager.hyprland = {
    enable = true;
    settings = settings // {
      bind = keybindings;
    };
  };
}

