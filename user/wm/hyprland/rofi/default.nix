{ config, pkgs, lib, userSettings, ... }:

{
  programs.rofi = {
    enable = true;
    terminal = userSettings.term;
    font = "${userSettings.font} 10";
  };

  home.packages = with pkgs; [
    rofi
    papirus-icon-theme
  ];
}

