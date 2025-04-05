{ config, lib, pkgs, userSettings, ... }:

{
  imports = [
    ./programs/hypr
    ./programs/fuzzel
    ./programs/swaync
    ./programs/waybar
    ./programs/wlogout
  ];

  home.packages = with pkgs; [
    # Hyprland-Tools
    hyprpaper hyprpicker cliphist grimblast swappy

    # Notifications / System
    libnotify brightnessctl networkmanagerapplet pamixer pavucontrol playerctl gsimplecal gnome-calculator

    # Wayland / Clipboard / Input
    waybar wtype wl-clipboard xdotool yad
  ];

  # Hyprland: eigene Skripte & Icons einbinden
  xdg.configFile."hypr/scripts" = {
    source = ./scripts;
    recursive = true;
  };

  xdg.configFile."hypr/icons" = {
    source = ./icons;
    recursive = true;
  };
}

