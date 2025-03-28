{ config, pkgs, lib, userSettings, ... }:
let
  wmModule =
    if userSettings.wm == "cosmic"
  then []
    else [ ./${userSettings.wm} ];
in 
{
  imports = wmModule ++ [
    # ./ml4w/ml4w.nix
    ./applets.nix
    ./wofi
    ./waybar
  ];
}

