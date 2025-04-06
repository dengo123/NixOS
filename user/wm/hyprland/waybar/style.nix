{ lib, pkgs, userSettings, themeDir, ... }:
let
  colors = lib.importTOML "${themeDir}/colors.toml";
in ''
  * {
    font-size: 11px;
    margin: 0;
    padding: 0;
    font-family: ${userSettings.font};
  }

  #waybar {
    background-color: rgba(0, 0, 0, 0.0); /* nur die Bar selbst ist transparent */
    color: ${colors.base05}; /* Standard-Textfarbe */
    padding: 0px 4px;
  }

  /* Modul-Container: links, mitte, rechts */
  .modules-left, .modules-right, .modules-center {
    background-color: ${colors.base01}; /* dezenter Hintergrund */
    border: 2px solid ${colors.base0D};  /* blauer Rahmen */
    border-radius: 15px;
    margin: 0 5px;
    padding: 0 4px;
  }

  /* Einzelmodule innerhalb der Gruppen */
  #workspaces button,
  #custom-launcher,
  #custom-temperature,
  #custom-swaync,
  #custom-playerctl,
  #clock,
  #network,
  #bluetooth,
  #pulseaudio,
  #cpu,
  #memory,
  #disk {
    margin: 0 5px;
    padding: 0 2px;
    background: transparent;
    border: none;
  }

  #workspaces button.active {
    color: ${colors.base0D};
  }

  #custom-swaync {
    color: ${colors.base05};
  }

  #custom-launcher {
    color: ${colors.base0E};
  }

  #custom-temperature {
    color: ${colors.base08};
  }

  #clock {
    color: ${colors.base05};
  }

  #custom-playerctl {
    color: ${colors.base0F};
  }

  #network {
    color: ${colors.base0C};
  }

  #bluetooth {
    color: ${colors.base0D};
  }

  #pulseaudio {
    color: ${colors.base0E};
  }

  #cpu {
    color: ${colors.base09};
  }

  #memory {
    color: ${colors.base0A};
  }

  #disk {
    color: ${colors.base0B};
  }
''

