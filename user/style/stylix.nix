{ config, lib, pkgs, userSettings, ... }:

let
  themeDir = "${config.home.homeDirectory}/.dotfiles/NixOS/themes/${userSettings.theme}";
  colorsYaml = "${themeDir}/colors.yaml";
  wallpaper = "${themeDir}/background.png";

  # Farben aus colors.yaml einlesen
  base16 = lib.fromYAML (builtins.readFile colorsYaml);
in
{
  stylix = {
    enable = true;

    # Setze Wallpaper
    image = wallpaper;

    # Lade Farben aus der YAML-Datei
    base16Scheme = {
      name = base16.scheme;
      base00 = base16.base00;
      base01 = base16.base01;
      base02 = base16.base02;
      base03 = base16.base03;
      base04 = base16.base04;
      base05 = base16.base05;
      base06 = base16.base06;
      base07 = base16.base07;
      base08 = base16.base08;
      base09 = base16.base09;
      base0A = base16.base0A;
      base0B = base16.base0B;
      base0C = base16.base0C;
      base0D = base16.base0D;
      base0E = base16.base0E;
      base0F = base16.base0F;
    };

    # Schriftarten aus Flake definieren
    fonts = {
      monospace = {
        package = pkgs.${userSettings.fontpkg};
        name = userSettings.font;
      };
    };

    targets = {
      ghostty.enable = true;
      neovim.enable = true;
      yazi.enable = true;
      gnome.enable = true; # für Cosmic-Desktop
    };
  };
}

