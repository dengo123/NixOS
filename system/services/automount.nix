{ config, lib, pkgs, userSettings, ... }:

{
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  services.devmon.enable = true;
  programs.udevil.enable = true;

  # Optional, falls du Polkit brauchst:
  security.polkit.enable = true;

  users.users.${userSettings.username}.extraGroups = [ "plugdev" "storage" ];
}

