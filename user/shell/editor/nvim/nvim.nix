{ config, lib, pkgs, ... }:

{
  programs.neovim = {
    enable = true;
    extraLuaConfig = builtins.readFile ../../user/shell/editor/nvim/nvim/init.lua;
  };

  home.file."${config.xdg.configHome}/nvim/lua/colors.lua" = {
    source = config.lib.file.mkOutOfStoreSymlink ../../user/shell/editor/nvim/nvim/lua/colors.lua;
  };
}

