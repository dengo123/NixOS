{ config, pkgs, lib, userSettings, inputs, ... }:

let
  themeDir = ../../themes/${userSettings.theme};
  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  colorsToml = if hasColorsToml then lib.importTOML "${themeDir}/colors.toml" else null;

  wallpaperPath =
    if builtins.pathExists "${themeDir}/background.png"
    then "${themeDir}/background.png"
    else userSettings.wallpaper;

  ompTemplate = builtins.readFile ../../user/shell/zsh/omp/template.toml;

in {
  imports = [ inputs.stylix.nixosModules.stylix ];

  config = lib.mkMerge [
    {
      stylix = {
        enable = true;
        image = wallpaperPath;
        polarity = "dark";

        base16Scheme = lib.mkIf hasColorsToml colorsToml;

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

    (lib.mkIf (config ? stylix.colors) {
      environment.etc = let
        sourceColors =
          if hasColorsToml then colorsToml else config.stylix.colors;

        renderTemplate = text:
          builtins.replaceStrings
            (map (x: "{{${x}}}") (builtins.attrNames sourceColors))
            (builtins.attrValues sourceColors)
            text;

        colorsLua = ''
          return {
            base00 = "${sourceColors.base00}", base01 = "${sourceColors.base01}", base02 = "${sourceColors.base02}",
            base03 = "${sourceColors.base03}", base04 = "${sourceColors.base04}", base05 = "${sourceColors.base05}",
            base06 = "${sourceColors.base06}", base07 = "${sourceColors.base07}", base08 = "${sourceColors.base08}",
            base09 = "${sourceColors.base09}", base0A = "${sourceColors.base0A}", base0B = "${sourceColors.base0B}",
            base0C = "${sourceColors.base0C}", base0D = "${sourceColors.base0D}", base0E = "${sourceColors.base0E}",
            base0F = "${sourceColors.base0F}",
          }
        '';
      in {
        "oh-my-posh/generated.omp.toml".text = renderTemplate ompTemplate;
        "nvim/colors.lua".text = colorsLua;
      };
    })
  ];
}

