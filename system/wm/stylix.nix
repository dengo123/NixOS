{ config, pkgs, lib, userSettings, inputs, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  wallpaperPath =
    if builtins.pathExists "${themeDir}/background.png"
    then "${themeDir}/background.png"
    else ../../themes/wallpapers/${userSettings.wallpaper};

  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  base16 = if hasColorsToml
    then lib.importTOML "${themeDir}/colors.toml"
    else config.stylix.colors;

in {
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = wallpaperPath;
    polarity = "dark";

    base16Scheme = lib.mkIf hasColorsToml base16;

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
}

