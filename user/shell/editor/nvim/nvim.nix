{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ./nvim/init.lua;
  };

  home.file."${config.xdg.configHome}/nvim/lua/colors.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../user/shell/editor/nvim/nvim/lua/colors.lua;
  };
}

