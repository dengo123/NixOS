{ config, lib, pkgs, ... }:

let
  lua = ''
    -- Set leader keys before any keybindings
    vim.g.mapleader = " "
    vim.g.maplocalleader = " "
  '';
in {
  programs.nixvim.extraConfigLua = lib.mkBefore lua;
}

