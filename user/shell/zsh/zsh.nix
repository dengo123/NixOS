{ config, lib, pkgs, ... }:

{
  programs.zsh.enable = true;
  programs.oh-my-posh.enable = true;

  imports = import ./plugins;
}

