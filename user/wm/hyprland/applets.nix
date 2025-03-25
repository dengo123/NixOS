{ pkgs, ... }:

{
  home.packages = with pkgs; [
    networkmanagerapplet
    blueman
  ];

  wayland.windowManager.hyprland.settings.exec-once = [
    "nm-applet"
    "blueman-applet"
  ];
}

