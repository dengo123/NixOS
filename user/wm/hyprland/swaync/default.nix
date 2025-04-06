{ config, pkgs, lib, userSettings, ... }:

let
  themeDir = ../../../../themes/${userSettings.theme};
  colors = lib.importTOML "${themeDir}/colors.toml";
in {
  home.packages = with pkgs; [ 
    swaynotificationcenter 
    wlsunset
    grimblast
    swappy
  ];


  services.swaync = {
    enable = true;

    # Importiere Einstellungen & CSS separat
    settings = import ./modules.nix { inherit lib userSettings; };
    style = import ./style.nix { inherit lib userSettings themeDir; };
  };
}

