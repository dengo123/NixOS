{ lib, pkgs, userSettings, themeDir, ... }:
let
  colors = lib.importTOML "${themeDir}/colors.toml";
in ''
  /* Grundlegender Font */
  * {
    font-family: "${userSettings.font}", "Symbols Nerd Font", monospace;
    font-size: 13px;
    margin: 0px;
    padding: 0px;
  }

  /* Halb- oder ganz transparent (je nach Vorliebe) */
  #waybar {
    background-color: rgba(0, 0, 0, 0.0);
    color: ${colors.base05};
  }

  /* Stil-Einstellungen für Module */
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
''

