{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  programs.fuzzel = {
    enable = true;

    settings = {
      main = {
        font = "${userSettings.font} 10";
        width = 40;
        lines = 10;
        horizontal-pad = 24;
        vertical-pad = 20;
      };

      colors = {
        background = "${colors.base00}cc";
        text = colors.base05;
        match = colors.base0D;
        selection = "${colors.base02}cc";
        selection-text = colors.base05;
        border = colors.base0D;
      };

      border = {
        width = 2;
        radius = 8;
      };
    };
  };

  home.packages = with pkgs; [
    wl-clipboard
    cliphist
    bc
    coreutils
    fuzzel
    (lib.getExe pkgs.bash)
  ];

  xdg.configFile."fuzzel/scripts".source = ./scripts;
  xdg.configFile."fuzzel/scripts".recursive = true;
}

