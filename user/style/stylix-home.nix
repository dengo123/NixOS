{ config, pkgs, lib, inputs, userSettings, ... }:

let
  themeDir = ../../user/style/themes/${userSettings.theme};
  wallpaperPath = if builtins.pathExists "${themeDir}/background.png"
    then "${themeDir}/background.png"
    else ../../user/style/wallpapers/${userSettings.wallpaper};

  hasColorsToml = builtins.pathExists "${themeDir}/colors.toml";
  base16 = if hasColorsToml then lib.importTOML "${themeDir}/colors.toml" else config.stylix.colors;

in {
  imports = [ inputs.stylix.homeManagerModules.stylix ];
  
  options.programs.cavalier = lib.mkOption {
    type = lib.types.attrs;
    default = {};
    description = "Stub, um fehlerhaftes Cavalier-Modul zu umgehen";
  };

  config = {
    stylix = {
      enable = true;
      image = wallpaperPath;

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
        gtk.enable = true;
        gnome.enable = true;
        console.enable = true;
      };
    };

    home.file = {
      "${config.xdg.configHome}/oh-my-posh/themes/generated.omp.toml".text = "...";
      "${config.xdg.configHome}/nvim/lua/colors.lua".text = "...";
    };
  };
}

