{ config, pkgs, ... }:

{
  home.packages = with pkgs; [
    wineWowPackages.full
    bottles
  ];

  home.shellAliases = {
    winecfg = "winecfg";
    winetricks = "winetricks";
  };

  fonts.fontconfig.enable = true;
}

