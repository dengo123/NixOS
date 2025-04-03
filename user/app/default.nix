{ config, pkgs, lib, inputs, userSettings, ... }:

{
  imports = [
    ./libreoffice.nix
    ./virt-home.nix
    ./term/${userSettings.term}
    ./browser/${userSettings.browser}
    ./gc-home.nix
  ];
}
