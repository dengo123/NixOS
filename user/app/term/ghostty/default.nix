{ pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  programs.ghostty = {
    enable = true;
    package = pkgs.ghostty;

    settings = {
      font-size = 12;
      font-family = userSettings.font;

      background = colors.base01;

      foreground = colors.base05;
      cursor-color = colors.base05;
    };

    enableZshIntegration = true;
  };
}

