{ config, lib, pkgs, ... }:

let
  lua = ''
    vim.keymap.set("n", "<leader>gd", vim.lsp.buf.definition, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>gr", vim.lsp.buf.references, { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, { noremap = true, silent = true })
  '';
in {
  programs.nixvim.plugins.lsp = {
    enable = true;
    servers = {
      ts_ls.enable = true;
      lua_ls.enable = true;
      html.enable = true;
      solargraph.enable = true;
    };
  };
  programs.nixvim.extraConfigLua = lib.mkAfter lua;
}

