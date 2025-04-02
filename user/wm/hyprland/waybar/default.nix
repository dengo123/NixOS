{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";

  waybarConfig = pkgs.writeText "waybar-config.json" (builtins.toJSON {
    layer = "top";
    position = "top";
    height = 15;
    margin = "10";
    spacing = 4;

    modules-left = [
      "custom-launcher"
      "custom-browser"
      "custom-calculator"
      "custom-mail"
      "wlr/taskbar"
      "window"
    ];

    modules-center = [
      "hyprland/workspaces"
    ];

    modules-right = [
      "custom-calendar"
      "network"
      "bluetooth"
      "pulseaudio"
      "custom-playerctl"
      "custom-brightness"
      "disk"
      "memory"
      "cpu"
      "custom-power"
    ];

    "custom-launcher" = {
      format = "";
      tooltip = false;
      on-click = "rofi -show drun";
    };

    "custom-browser" = {
      format = "";
      tooltip = "Firefox";
      on-click = "firefox";
    };

    "custom-calculator" = {
      format = "";
      tooltip = "Calculator";
      on-click = "gnome-calculator";
    };

    "custom-mail" = {
      format = "";
      tooltip = "E-Mail (Thunderbird)";
      on-click = "thunderbird";
    };

    "custom-calendar" = {
      format = "{:%a %d.%m %H:%M}";
      tooltip-format = "{:%Y-%m-%d %H:%M:%S}";
      on-click = "gsimplecal";
    };

    "custom-playerctl" = {
      format = "{status_icon} {title}";
      format-icons = {
        playing = "";
        paused = "";
        stopped = "";
      };
      exec = "playerctl metadata --format '{{status}} {{title}}'";
      interval = 5;
    };

    "custom-brightness" = {
      format = " {percent}%";
      exec = "brightnessctl | awk '/Current/ {print $4}' | tr -d '()'";
      interval = 5;
      tooltip = false;
    };

    "pulseaudio" = {
      format = "{icon} {volume}%";
      format-muted = "󰖁";
      format-icons = [ "" "" ];
      on-click = "pavucontrol";
    };

    "network" = {
      format-wifi = " {essid}";
      format-ethernet = " {ipaddr}";
      format-disconnected = "";
      on-click = "nm-connection-editor";
    };

    "bluetooth" = {
      format = "";
      on-click = "blueman-manager";
    };

    "disk" = {
      format = " {free}";
      path = "/home";
      interval = 30;
    };

    "memory" = {
      format = " {used:0.1f}G";
      interval = 5;
    };

    "cpu" = {
      format = " {usage}%";
      interval = 5;
    };

    "custom-power" = {
      format = "⏻";
      tooltip = "Power Menu";
      on-click = "wlogout";
    };
  });

  waybarStyle = pkgs.writeText "waybar-style.css" ''
    * {
      font-family: "${userSettings.font}";
      font-size: 13px;
      border-radius: 10px;
      padding: 5px;
      margin: 0px;
    }

    #waybar {
      background-color: rgba(0, 0, 0, 0.5);
      color: ${colors.base05};
    }

    #workspaces button,
    #window,
    #taskbar,
    #custom-launcher,
    #custom-browser,
    #custom-calculator,
    #custom-mail,
    #custom-power,
    #custom-calendar,
    #custom-playerctl,
    #custom-brightness,
    #network,
    #bluetooth,
    #pulseaudio,
    #cpu,
    #memory,
    #disk {
      background-color: rgba(255, 255, 255, 0.1);
      margin: 4px 6px;
      padding: 4px 10px;
      border-radius: 10px;
    }

    #workspaces button.active {
      background-color: ${colors.base0D};
      color: ${colors.base00};
    }

    #custom-power {
      color: ${colors.base08};
    }
  '';
in
{
  home.packages = with pkgs; [
    waybar
    gnome-calculator
    blueman
    pavucontrol
    gsimplecal
    brightnessctl
    playerctl
    thunderbird
  ];

  programs.waybar = {
    enable = true;
    settings.mainBar = builtins.fromJSON (builtins.readFile waybarConfig);
    style = lib.mkForce (builtins.readFile waybarStyle);
  };

  xdg.configFile."waybar/config.json".source = waybarConfig;
  xdg.configFile."waybar/style.css".source = waybarStyle;
}

