{ inputs, config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  importedColorsPath = "${themeDir}/colors.toml";
  monoFont = {
    name = userSettings.font;
    package = userSettings.fontPkg;
  };
in
{
  imports = [ inputs.stylix.homeManagerModules.stylix ];

  stylix = {
    enable = true;
    autoEnable = true;

    base16Scheme = lib.mkIf hasColorsToml (lib.importTOML importedColorsPath);

    fonts = {
      monospace = monoFont;
      sansSerif = monoFont;
      serif = monoFont;
      emoji = {
        name = "Noto Color Emoji";
        package = pkgs.noto-fonts-emoji;
      };
    };
  };
}

