{
  lib,
  userSettings,
  inputs,
  ...
}: let
  themeDir = ../../themes/${userSettings.theme};
  importedColors = lib.importTOML "${themeDir}/colors.toml";
in {
  imports = [inputs.stylix.nixosModules.stylix];

  stylix = {
    enable = true;
    image = "${themeDir}/background.png";
    polarity = "dark";

    base16Scheme = importedColors;

    fonts.monospace = {
      package = userSettings.fontPkg;
      name = userSettings.font;
    };

    cursor = {
      name = userSettings.cursor;
      package = userSettings.cursorPkg;
      size = 22;
    };
  };
}
