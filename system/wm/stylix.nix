{ config, pkgs, lib, userSettings, inputs, ... }:
{
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = userSettings.wallpaper;

    fonts = {
      monospace = {
        package = pkgs.${userSettings.fontpkg};
        name = userSettings.font;
      };
    };

    enableReleaseChecks = false;
  };
}

