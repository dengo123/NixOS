{ config, pkgs, lib, ... }:

let
  waybarConfig = ./config.json;
  waybarStyle  = ./style.css;
in {
  programs.waybar = {
    enable = true;

    settings = {
      mainBar = builtins.fromJSON (builtins.readFile waybarConfig);
    };

    style = builtins.readFile waybarStyle;
  };

  xdg.configFile."waybar/config.json".source = waybarConfig;
  xdg.configFile."waybar/style.css".source = waybarStyle;

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

