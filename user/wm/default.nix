{ userSettings, ... }:
let
  wmModule =
    if userSettings.wm == "cosmic"
  then []
    else [ ./${userSettings.wm} ];
in 
{
  imports = wmModule;
}

