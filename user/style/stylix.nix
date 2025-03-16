{ config, lib, pkgs, inputs, userSettings, ... }:

let
  themePath = "../../../themes" + ("/" + userSettings.theme + "/" + userSettings.theme) + ".yaml";
  theme = builtins.fromYAML (builtins.readFile themePath);
in {

  imports = [ inputs.stylix.homeManagerModules.stylix ];

  config = {
    home.file.".currenttheme".text = userSettings.theme;
    stylix.autoEnable = false;
    stylix.base16Scheme = ./. + themePath;

    # Dynamische Farbgestaltung für Terminals (z.B. WezTerm, Alacritty, etc.)
    style.terminalColors = {
      background = theme.background;
      foreground = theme.foreground;
      cursor = theme.cursor;
      ansi = {
        black   = theme.black;
        red     = theme.red;
        green   = theme.green;
        yellow  = theme.yellow;
        blue    = theme.blue;
        magenta = theme.magenta;
        cyan    = theme.cyan;
        white   = theme.white;
      };
      brights = {
        black   = theme.bright_black;
        red     = theme.bright_red;
        green   = theme.bright_green;
        yellow  = theme.bright_yellow;
        blue    = theme.bright_blue;
        magenta = theme.bright_magenta;
        cyan    = theme.bright_cyan;
        white   = theme.bright_white;
      };
    };

    # Font-Konfigurationen
    stylix.fonts = {
      monospace = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      serif = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      sansSerif = {
        name = userSettings.font;
        package = userSettings.fontPkg;
      };
      emoji = {
        name = "Noto Emoji";
        package = pkgs.noto-fonts-monochrome-emoji;
      };
      sizes = {
        terminal = 18;
        applications = 12;
        popups = 12;
        desktop = 12;
      };
    };

    fonts.fontconfig.defaultFonts = {
      monospace = [ userSettings.font ];
      sansSerif = [ userSettings.font ];
      serif = [ userSettings.font ];
    };
  };
}

