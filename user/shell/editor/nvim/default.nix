{ config, pkgs, lib, ... }:

{
  programs.nixvim = { 
    enable = true;
    colorschemes.base16.enable = true;
    
  };
  imports = import ./plugins;
}

