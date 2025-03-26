{ config, pkgs, userSettings, lib, ... }:

{
  imports = [
    ./core.nix
    ./hyprlock.nix
    ./waybar.nix
    ./swww.nix
    ./dunst.nix
    ./wofi.nix
  # ./plugins.nix
  ];
}


