{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
  wallpaper = "${themeDir}/background.png";
in
{
  imports = [ inputs.stylix.nixosModules.stylix ];  

  stylix = {
    enable = true;

    image = wallpaper;

    base16Scheme = {
      name = colors.scheme;
      base00 = colors.base00;
      base01 = colors.base01;
      base02 = colors.base02;
      base03 = colors.base03;
      base04 = colors.base04;
      base05 = colors.base05;
      base06 = colors.base06;
      base07 = colors.base07;
      base08 = colors.base08;
      base09 = colors.base09;
      base0A = colors.base0A;
      base0B = colors.base0B;
      base0C = colors.base0C;
      base0D = colors.base0D;
      base0E = colors.base0E;
      base0F = colors.base0F;
    };

    fonts = {
      monospace = {
        package = pkgs.${userSettings.fontpkg};
        name = userSettings.font;
      };
    };

    targets = {
      console.enable = true;
      gtk.enable = true;
      gnome.enable = true;     # für Cosmic, falls relevant
      sway.enable = false;     # aktivieren wenn nötig
      hyprland.enable = false; # aktivieren wenn nötig
    };
  };
}

