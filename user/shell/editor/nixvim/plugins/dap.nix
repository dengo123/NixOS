{ config, lib, pkgs, ... }:

let
  lua = ''
    vim.keymap.set("n", "<leader>dt", require("dap").toggle_breakpoint, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>dc", require("dap").continue, { noremap = true, silent = true })
  '';
in {
  programs.nixvim.plugins.dap.enable = true;
  programs.nixvim.plugins.dap-ui.enable = true;

  programs.nixvim.extraConfigLua = lib.mkAfter lua;
}

