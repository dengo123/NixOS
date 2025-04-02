{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";

  systemMonitorScript = pkgs.writeShellScript "waybar-system-status" ''
    cpu="$(top -bn1 | grep "Cpu(s)" | awk '{print $2 + $4}')"
    ram="$(free -h | awk '/Mem:/ {print $3 "/" $2}')"
    gpu="$(lspci | grep -i 'vga\\|3d\\|display' | cut -d ':' -f3- | sed 's/^ *//')"

    get_disk_info() {
      df -h "$1" 2>/dev/null | awk 'NR==2 {print $6 ": " $4 " frei"}'
    }

    disk_home=$(get_disk_info /home)
    disk_nix=$(get_disk_info /nix)
    disk_root=$(get_disk_info /)
    disk_extra=$(get_disk_info /mnt/8tb)

    echo "{\"text\": \"\", \"tooltip\": \"CPU: ${cpu}%\\nRAM: ${ram}\\nGPU: ${gpu}\\n${disk_home}\\n${disk_nix}\\n${disk_root}\\n${disk_extra}\"}"
  '';

  waybarConfig = pkgs.writeText "waybar-config.json" (builtins.toJSON {
    layer = "top";
    position = "top";
    height = 30;
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
      "custom-system"
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

    "custom-system" = {
      format = "";
      tooltip = true;
      return-type = "json";
      exec = systemMonitorScript;
      interval = 10;
      on-click = "${userSettings.term} -e btop";
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
      background-color: rgba(0, 0, 0, 0.5); /* Transparent */
      color: ${colors.base05};
    }

    /* Floating Button-Stil */
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
    #custom-system,
    #network,
    #bluetooth,
    #pulseaudio {
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
    btop
  ];

  programs.waybar = {
    enable = true;
    settings.mainBar = builtins.fromJSON (builtins.readFile waybarConfig);
    style = lib.mkForce (builtins.readFile waybarStyle);
  };

  xdg.configFile."waybar/config.json".source = waybarConfig;
  xdg.configFile."waybar/style.css".source = waybarStyle;
}

