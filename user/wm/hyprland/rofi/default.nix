{ config, pkgs, lib, userSettings, ... }:

let
  rofiStyle = pkgs.writeText "stylix-rofi-layout.rasi" ''
    configuration {
      show-icons: true;
      icon-theme: "Papirus";
    }

    * {
      border: 0;
      border-radius: 10px;
      padding: 10px;
    }

    window {
      location: center;
      anchor: center;
      fullscreen: false;
      width: 600px;
      transparency: "real";
      blur: true;
      padding: 20px;
    }

    listview {
      lines: 10;
      fixed-height: true;
      columns: 1;
    }

    textbox-prompt-colon {
      expand: false;
      str: ":";
    }

    element-icon {
      size: 1.2em;
    }

    entry {
      placeholder: "Type to search...";
    }
  '';
in
{
  home.packages = with pkgs; [
    rofi-wayland
    papirus-icon-theme
  ];

  programs.rofi = {
    enable = true;
    theme = "stylix";
    terminal = userSettings.term;

    extraConfig = {
      modi = "drun,run,window";
      show-icons = true;
      icon-theme = "Papirus";
    };
  };

  xdg.configFile."rofi/themes/stylix.rasi".source = rofiStyle;
}

