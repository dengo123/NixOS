{ lib, pkgs, userSettings, themeDir, ... }:
let
  colors = lib.importTOML "${themeDir}/colors.toml";
in ''
  /* Grundlegender Font */
  * {
    font-size: 12px;
    margin: 0px;
    padding: 0px;
  }

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
    margin: 0 5px 5px 5px;
    padding: 0 10px 0 10px;
    border: 2px solid ${colors.base0D};
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

