{ config, pkgs, lib, userSettings, inputs, ... }:

let
  # Theme-Verzeichnis
  themeDir = ../../themes/${userSettings.theme};
  wallpaperPath =
    if builtins.pathExists "${themeDir}/background.png"
    then "${themeDir}/background.png"
    else ../../wallpapers/${userSettings.wallpaper};

  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  base16 = if hasColorsToml
    then lib.importTOML "${themeDir}/colors.toml"
    else config.stylix.colors;

  # oh-my-posh template laden und mit Stylix-Farben ersetzen
  ompTemplate = builtins.readFile ../../user/shell/zsh/omp/template.toml;
  renderTemplate = text:
    builtins.replaceStrings
      (map (x: "{{${x}}}") (builtins.attrNames base16))
      (builtins.attrValues base16)
      text;

  # Neovim-Farbwerte als Lua-Datei rendern
  colorsLua = ''
    return {
      base00 = "${base16.base00}",
      base01 = "${base16.base01}",
      base02 = "${base16.base02}",
      base03 = "${base16.base03}",
      base04 = "${base16.base04}",
      base05 = "${base16.base05}",
      base06 = "${base16.base06}",
      base07 = "${base16.base07}",
      base08 = "${base16.base08}",
      base09 = "${base16.base09}",
      base0A = "${base16.base0A}",
      base0B = "${base16.base0B}",
      base0C = "${base16.base0C}",
      base0D = "${base16.base0D}",
      base0E = "${base16.base0E}",
      base0F = "${base16.base0F}",
    }
  '';

in {
  imports = [ inputs.stylix.nixosModules.stylix ];

  stylix = {
    enable = true;
    image = wallpaperPath;
    polarity = "dark";

    base16Scheme = lib.mkIf hasColorsToml base16;

    fonts.monospace = {
      package = userSettings.fontpkg;
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

  # Dateien unter /etc bereitstellen
  environment.etc = {
    "oh-my-posh/generated.omp.toml".text = renderTemplate ompTemplate;
    "nvim/colors.lua".text = colorsLua;
  };
}

