{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    stylix.enable = true;
  };
  imports = import ./plugins;
}
