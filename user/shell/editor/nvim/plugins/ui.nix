{ config, lib, pkgs, ... }:

{
  programs.nixvim = {
    plugins = {
      web-devicons.enable = true;
      indent-blankline.enable = true;
      lualine = {
        enable = true;
        settings.options = {
          theme = "auto";
          component_separators = { left = ""; right = ""; };
          section_separators = { left = ""; right = ""; };
        };
      };
    };
    extraConfigLua = ''
      vim.opt.number = true
      vim.opt.relativenumber = true
    '';
  };
}

