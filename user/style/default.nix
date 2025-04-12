{ inputs, lib, pkgs, userSettings, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  importedColors = lib.importTOML "${themeDir}/colors.toml";
in
{
  imports = [ 
    inputs.stylix.homeManagerModules.stylix 
    ./nixvim
  ];

  stylix = {
    enable = true;
    image = "${themeDir}/background.png";
    polarity = "dark";
    base16Scheme = importedColors;

    opacity.terminal = 0.8;

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
    targets = {
      hyprlock.enable = false;
      swaync.enable = false;
      ghostty.enable = false;
      firefox.profileNames = [ "default" ];
    };
  };
}

