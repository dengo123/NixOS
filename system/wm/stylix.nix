{ config, pkgs, lib, userSettings, inputs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = userSettings.wallpaper;
    polarity = "dark";

    fonts = {
      monospace = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
    };

    enableReleaseChecks = false;
  };
}

