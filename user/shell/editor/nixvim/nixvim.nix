{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    enable = true;
    plugins = import ./plugins;
  };
}
