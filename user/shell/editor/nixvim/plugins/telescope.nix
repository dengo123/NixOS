{ config, lib, pkgs, ... }:

let
  lua = ''
    vim.keymap.set("n", "<leader>ff", ":Telescope find_files<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fg", ":Telescope live_grep<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fb", ":Telescope buffers<CR>", { noremap = true, silent = true })
    vim.keymap.set("n", "<leader>fh", ":Telescope help_tags<CR>", { noremap = true, silent = true })
  '';
in {
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions."ui-select".enable = true;
  };
  programs.nixvim.extraConfigLua = lib.mkAfter lua;
}

