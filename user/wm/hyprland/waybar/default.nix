{ config, pkgs, lib, userSettings, ... }:

let
  # Verzeichnis zu deinen Themes (z.B. falls du hier "colors.toml" hast)
  themeDir = ../../../../themes/${userSettings.theme};

  # Import der beiden Dateien
  waybarModules = import ./modules.nix {
    inherit lib pkgs userSettings;
  };

  waybarStyle = import ./style.nix {
    inherit lib pkgs userSettings themeDir;
  };

in {
  # Packages, die Waybar oder deine Custom-Module brauchen:
  home.packages = with pkgs; [
    waybar
    gnome-calculator
    blueman
    pavucontrol
    gsimplecal
    brightnessctl
    playerctl
    networkmanagerapplet
    nerd-fonts.symbols-only
    lm_sensors
    psmisc
  ];

  # Nun konfigurieren wir Waybar via Home-Manager
  programs.waybar = {
    enable = true;

    # 1) mainBar-Einstellung direkt als Nix-Objekt:
    settings.mainBar = waybarModules;

    # 2) CSS-Style:
    style = lib.mkForce waybarStyle;

    # Falls du Waybar NICHT nochmal per xdg.configFile ausliefern willst,
    # reicht das i. d. R. aus.
  };

  # Optional: wenn du die JSON-Datei + style.css im ~/.config/waybar/ Verzeichnis haben willst:
  xdg.configFile."waybar/config.json".text = builtins.toJSON waybarModules;
  xdg.configFile."waybar/style.css".text   = waybarStyle;
}

