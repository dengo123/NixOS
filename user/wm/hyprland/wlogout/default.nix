{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in
{
  home.packages = with pkgs; [ wlogout ];

  xdg.configFile."wlogout/style.css".text = ''
    * {
      background-image: none;
      background-color: ${colors.base00};
      color: ${colors.base05};
      font-family: "${userSettings.font}";
      font-size: 16px;
      border-radius: 10px;
    }

    button {
      background-color: ${colors.base01};
      border: 2px solid ${colors.base0D};
      margin: 10px;
      padding: 10px;
    }

    button:hover {
      background-color: ${colors.base0D};
      color: ${colors.base00};
    }
  '';

  xdg.configFile."wlogout/layout".text = ''
    shutdown reboot logout suspend hibernate
  '';
}

