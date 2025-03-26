{ config, lib, pkgs, ... }:

{
  programs.nixvim.plugins.none-ls = {
    enable = true;
    sources.formatting = {
      stylua.enable = true;
      black.enable = true;
      prettier = {
        enable = true;
        disableTsServerFormatter = true;
      };
    };
  };
}

