{ config, pkgs, lib, userSettings, ... }:

{
  imports = [
    ./stylix-home.nix
    ./applets.nix
    ./${userSettings.wm}
  ];
}
