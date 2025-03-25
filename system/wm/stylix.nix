{ config, pkgs, lib, userSettings, inputs, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  wallpaperPath =
    if builtins.pathExists "${themeDir}/background.png"
    then "${themeDir}/background.png"
    else ../../themes/wallpapers/${userSettings.wallpaper}.png;

  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  importedColors = lib.importTOML "${themeDir}/colors.toml";

  tomlGenerator = pkgs.formats.toml { };
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = wallpaperPath;
    polarity = "dark";

    base16Scheme = lib.mkIf hasColorsToml importedColors;

    fonts.monospace = {
      package = userSettings.fontPkg;
      name = userSettings.font;
    };

    cursor = {
      name = userSettings.cursor or "Bibata-Modern-Ice";
      package = pkgs.bibata-cursors;
      size = 22;
    };

    targets = {
      console.enable = true;
      gtk.enable = true;
      gnome.enable = true;
    };

    enableReleaseChecks = false;
  };

  environment.etc."stylix/colors.toml".source =
    if hasColorsToml
    then "${themeDir}/colors.toml"
    else tomlGenerator.generate "colors.toml" config.stylix.base16Scheme;
}

