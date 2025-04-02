{ config, pkgs, userSettings, lib, ... }:

{
  imports = [
    ./core.nix
    ./hyprlock.nix
    #   ./swww.nix
    ./dunst.nix
    ./wofi.nix
  # ./plugins.nix
  ];
}


