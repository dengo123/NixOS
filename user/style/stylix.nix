{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = "${config.home.homeDirectory}/.dotfiles/NixOS/themes/${userSettings.theme}";
  colorsToml = "${themeDir}/colors.toml";
  wallpaper = "${themeDir}/background.png";

  base16 = if builtins.pathExists colorsToml
    then lib.importTOML colorsToml
    else null;
in
{
  stylix = {
    enable = true;

    image = wallpaper;

    base16Scheme = if base16 != null then {
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
    } else null;

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
      gnome.enable = true;
    };
  };
}

