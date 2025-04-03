{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  home.packages = with pkgs; [ wlogout ];

  # JSON: Buttons und Aktionen
  xdg.configFile."wlogout/config.json".text = builtins.toJSON [
    {
      label = "lock";
      action = "exec hyprlock";
      text = "Lock";
      keybind = "l";
    }
    {
      label = "logout";
      action = "loginctl terminate-user ${userSettings.username}";
      text = "Logout";
      keybind = "e";
    }
    {
      label = "suspend";
      action = "systemctl suspend";
      text = "Suspend";
      keybind = "s";
    }
    {
      label = "hibernate";
      action = "systemctl hibernate";
      text = "Hibernate";
      keybind = "h";
    }
    {
      label = "reboot";
      action = "systemctl reboot";
      text = "Reboot";
      keybind = "r";
    }
    {
      label = "shutdown";
      action = "systemctl poweroff";
      text = "Shutdown";
      keybind = "q";
    }
  ];

  # CSS: Style für das Fenster und die Buttons
  xdg.configFile."wlogout/style.css".text = ''
    * {
      background-image: none;
      background-color: ${colors.base00};
      font-family: "${userSettings.font}";
      font-size: 16px;
      border-radius: 10px;
      border: 2px solid ${colors.base02};
      color: ${colors.base05};
    }

    button {
      margin: 10px;
      padding: 10px;
      border-radius: 10px;
    }

    /* Individuelle Farben */
    button:nth-child(1) { background-color: ${colors.base0B}; } /* Lock */
    button:nth-child(2) { background-color: ${colors.base0A}; } /* Logout */
    button:nth-child(3) { background-color: ${colors.base0D}; } /* Suspend */
    button:nth-child(4) { background-color: ${colors.base0E}; } /* Hibernate */
    button:nth-child(5) { background-color: ${colors.base09}; } /* Reboot */
    button:nth-child(6) { background-color: ${colors.base08}; } /* Shutdown */

    button:hover {
      background-color: ${colors.base0C};
      color: ${colors.base00};
    }
  '';
}

