{ lib, pkgs, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  layer = "top";
  position = "top";
  height = 32;
  margin = "10px 5px 0 5px";
  spacing = 3;

  "modules-left" = [
    "custom/launcher"
    "hyprland/workspaces"
    "custom/window"
  ];

  "modules-center" = [
    "clock"
  ];

  "modules-right" = [
    "pulseaudio"
    "bluetooth"
    "network"
    "disk"
    "memory"
    "cpu"
    "custom/temperature"
    "custom/swaync"
  ];

  ########################
  # Custom-Module
  ########################

  "custom/launcher" = {
    format = "󱓞";
    tooltip = true;
    "on-click" = "rofi -show drun";
    interval = 0;
  };

  "custom/swaync" = {
    exec = ''
      if swaync-client -D | grep -q true; then
        echo -n '{"text": "", "tooltip": "Do Not Disturb", "class": "dnd-active"}'
      else
        echo -n '{"text": "", "tooltip": "", "class": "dnd-inactive"}'
      fi
    '';
    return-type = "json";
    format = "{} ";
    interval = 2;
    on-click = "swaync-client -t -sw";
    escape = true;
  };

  "custom/window" = {
    format = "{}";
    exec = "~/.dotfiles/NixOS/user/wm/hyprland/waybar/scripts/window-title.sh";
    interval = 1;
    tooltip = false;
  };

  "custom/temperature" = {
    format = " {}°C";
    exec = "awk '{printf \"%d\", $1 / 1000}' /sys/class/hwmon/hwmon2/temp1_input";
    interval = 10;
    tooltip = true;
  };

  ########################
  # Built-in Module
  ########################

  "clock" = {
    format = "<span color='${colors.base0A}'>󰃰</span> <span color='${colors.base05}'>{:%H:%M  %d.%m}</span>";
    tooltip-format = "<tt>{calendar}</tt>";
    "on-click" = "gsimplecal";
    interval = 60;
    calendar = {
      mode = "month";
      format = {
        months = "<span color='${colors.base0A}'><b>{}</b></span>";
        weekdays = "<span color='${colors.base0C}'><b>{}</b></span>";
        today = "<span color='${colors.base08}'><b>{}</b></span>";
      };
    };
  };

  "network" = {
    format-wifi = " {essid}";
    format-ethernet = "󰈁 {ipaddr}";
    format-disconnected = "󱚼";
    "on-click" = "nm-connection-editor";
  };

  "bluetooth" = {
    format = "";
    "on-click" = "blueman-manager";
  };

  "pulseaudio" = {
    format = "{icon} {volume}%";
    "format-muted" = "";
    "format-icons" = [ "" "" ];
    "on-click" = "pavucontrol";
  };

  "memory" = {
    format = " {used:0.1f}G";
    interval = 5;
  };

  "cpu" = {
    format = " {usage}%";
    interval = 5;
  };

  "disk" = {
    format = " {free}";
    path = "/home";
    interval = 30;
  };
}

