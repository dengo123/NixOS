{ config, lib, pkgs, ... }:

let
  waybarConfig = ./config.json;
in
{
  programs.waybar = {
    enable = true;
    settings = {
      mainBar = builtins.fromJSON (builtins.readFile waybarConfig);
    };
  };

  xdg.configFile."waybar/config.json".source = waybarConfig;

  home.packages = with pkgs; [
    waybar
    blueberry
    brightnessctl
    playerctl
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "waybar"
  ];
}

