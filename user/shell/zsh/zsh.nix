{ config, lib, pkgs, ... }:

{
  programs.zsh.enable = true;

  imports = import ./plugins;
}

