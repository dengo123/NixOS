{ lib, pkgs, userSettings, ... }:

{
  layer = "top";
  position = "top";

  # Waybar verlangt hier einen Integer
  # Achtung: Falls dein CSS die Leiste höher macht,
  # bekommst du eine Warnung, "Requested height is less than min. needed".
  height = 42;

  # margin muss bei vielen Waybar-Modulen ein String sein (falls Home-Manager das so fordert).
  margin = "0";
  spacing = 3;

  # Hier die Anordnung der Module:
  "modules-left" = [
    "custom/launcher"
    "custom/browser"
    "custom/calculator"
    "custom/mail"
    "wlr/taskbar"
    "hyprland/window" 
  ];

  "modules-center" = [
    "hyprland/workspaces"
  ];

  "modules-right" = [
    "custom/calendar"
    "network"
    "bluetooth"
    "pulseaudio"
    "custom/playerctl"
    "custom/brightness"
    "disk"
    "memory"
    "cpu"
    "custom/power"
  ];

  ########################
  # Definition der Custom-Module
  ########################

  "custom/launcher" = {
    # Standard: Du kannst "exec" + "interval" verwenden oder "on-click", "format" usw.
    # "interval=0" => Waybar führt "exec" nur einmal aus oder auf Klick (je nach Version).
    # Wenn du nur ein Icon zeigen willst, kannst du `format = ""` verwenden.
    format = "󱄅";
    tooltip = true;
    "on-click" = "rofi -show drun";
    interval = 0;
  };

  "custom/browser" = {
    format = "";
    tooltip = "Firefox";
    "on-click" = "firefox";
    interval = 0;
  };

  "custom/calculator" = {
    format = "󰪚";
    tooltip = "Calculator";
    "on-click" = "gnome-calculator";
    interval = 0;
  };

  "custom/mail" = {
    format = "";
    tooltip = "E-Mail (Thunderbird)";
    "on-click" = "thunderbird";
    interval = 0;
  };

  "custom/calendar" = {
    "exec" = "date +'%a %d.%m %H:%M'";
    "interval" = 60;
    "format" = "{}"; 
    "on-click" = "gsimplecal";
  };

  "custom/playerctl" = {
    format = "{status_icon} {title}";
    format-icons = {
      playing = "";
      paused = "";
      stopped = "";
    };
    exec = "playerctl metadata --format '{{status}} {{title}}'";
    interval = 5;
  };

  "custom/brightness" = {
    format = " {percent}%";
    "exec" = "sh -c 'brightnessctl | awk \"/Current/ {print $4}\" | tr -d \"()\"'";
    "interval" = 5;
    tooltip = true;
  };

  "custom/power" = {
    format = "⏻";
    tooltip = "Power Menu";
    "on-click" = "wlogout";
  };

  ########################
  # Definition der eingebauten Module
  ########################

  "pulseaudio" = {
    format = "{icon} {volume}%";
    "format-muted" = "";
    "format-icons" = [ "" "" ];
    "on-click" = "pavucontrol";
  };

  "network" = {
    "format-wifi" = "{essid}";
    "format-ethernet" = "󰈁 {ipaddr}";
    "format-disconnected" = "󱚼";
    "on-click" = "nm-connection-editor";
  };

  "bluetooth" = {
    format = "󰂯";
    "on-click" = "blueman-manager";
  };

  "disk" = {
    format = " {free}";
    path = "/home";
    interval = 30;
  };

  "memory" = {
    format = " {used:0.1f}G";
    interval = 5;
  };

  "cpu" = {
    format = " {usage}%";
    interval = 5;
  };
}

