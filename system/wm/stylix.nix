{ config, pkgs, lib, userSettings, inputs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = userSettings.wallpaper;

    fonts = {
      monospace = {
        package = userSettings.fontPkg;
        name = userSettings.font;
      };
    };

    enableReleaseChecks = false;
  };
}

