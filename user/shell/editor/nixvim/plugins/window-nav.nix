{ config, lib, pkgs, ... }:

let
  lua = ''
    -- Fenster-Navigation
    vim.keymap.set("n", "<C-h>", "<C-w>h", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-l>", "<C-w>l", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-j>", "<C-w>j", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-k>", "<C-w>k", { noremap = true, silent = true })

    -- Tabs
    vim.keymap.set("n", "<C-t>", ":tabnew<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-n>", ":tabnext<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-b>", ":tabprevious<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<C-w>", ":tabclose<CR>", { noremap = true, silent = true })
  '';
in {
  programs.nixvim.extraConfigLua = lib.mkAfter lua;
}

