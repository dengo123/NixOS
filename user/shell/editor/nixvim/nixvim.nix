{ config, pkgs, lib, ... }:

let
  colorsLua = import ../../../lib/colors-to-lua.nix { inherit lib; };
in
{
  programs.nixvim.enable = true;

  imports = import ./plugins

  home.file."${config.xdg.configHome}/nvim/lua/colors.lua".text = colorsLua;

}

