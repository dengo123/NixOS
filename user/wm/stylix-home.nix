{ inputs, config, lib, pkgs, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  importedColors = lib.importTOML "${themeDir}/colors.toml";
in
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix = {
    enable = true;
    image = "${themeDir}/background.png";
    polarity = "dark";
    base16Scheme = importedColors;

    fonts = {
      monospace = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
      serif = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
      sansSerif = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
      emoji = {
        package = pkgs.noto-fonts-emoji;
        name = "Noto Color Emoji";
      };
    };

    cursor = {
      name = userSettings.cursor;
      package = userSettings.cursorPkg;
      size = userSettings.cursorSize;
    };
    targets.hyprlock.enable = false;
    targets.swaync.enable = false;
  };
}

