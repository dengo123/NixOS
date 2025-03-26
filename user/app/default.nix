{ config, pkgs, lib, inputs, userSettings, ... }:

{
  imports = [
    ./libreoffice.nix
    ./virt-home.nix
    ./term/${userSettings.term}/${userSettings.term + ".nix"}
    ./gc-home.nix
  ];
}
