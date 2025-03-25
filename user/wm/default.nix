{ config, pkgs, lib, userSettings, ... }:

{
  imports = [
    ./applets.nix
    ./${userSettings.wm}
  ];
}
