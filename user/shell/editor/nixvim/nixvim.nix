{ config, lib, pkgs, ... }:

{
  programs.nixvim.enable = true;
  imports = import ./plugins;
}
