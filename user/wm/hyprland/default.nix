{ config, lib, pkgs, userSettings, ... }:

{
  imports = [
    ./core.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./waybar.nix
    ./dunst.nix
    ./applets.nix
    ./plugins.nix
  ];
}

