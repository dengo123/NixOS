{ lib, pkgs, userSettings, ... }:

{
  layer = "top";
  position = "top";
  height = 30;
  margin = "10px 5px 0 5px";
  spacing = 3;

  "modules-left" = [
    "custom/launcher"
    "hyprland/workspaces"
  ];

  "modules-center" = [
    "custom/calendar"
    "custom/playerctl"
  ];

  "modules-right" = [
    "pulseaudio"
    "bluetooth"
    "network"
    "disk"
    "memory"
    "cpu"
    "custom/power"
  ];

  "custom/launcher" = {
    format = "󱄅";
    tooltip = true;
    "on-click" = "rofi -show drun";
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

  "custom/power" = {
    format = "⏻";
    tooltip = "Power Menu";
    "on-click" = "wlogout";
  };

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

