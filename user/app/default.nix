{ config, pkgs, lib, inputs, userSettings, ... }:

{
  imports = [
    ./libreoffice
    ./virt
    ./term/${userSettings.term}
    ./browser/${userSettings.browser}
    ./mail
    ./gc-home.nix
  ];
}
