{ pkgs }:

{
  home.packages = with pkgs; [
    waybar
    dunst
    hyprpaper
    networkmanagerapplet
    blueman
  ];

  exec-once = [
    "waybar"
    "dunst"
    "hyprpaper"
    "nm-applet"
    "blueman-applet"
  ];
}

