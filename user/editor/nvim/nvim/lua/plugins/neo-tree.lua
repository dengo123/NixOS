return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  config = function()
    -- Keybindings
    vim.keymap.set("n", "<leader>n", ":Neotree filesystem reveal left<CR>", {})
    vim.keymap.set("n", "<leader>bf", ":Neotree buffers reveal float<CR>", {})

    -- Configuration for Neo-tree
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = true,
        group_empty_dirs = true,
        hide_dotfiles = false,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },
      window = {
        transparent_panel = true, -- Transparenz für das Panel
      },
    })

    -- Highlight-Gruppen explizit setzen
    vim.cmd("highlight NeoTreeNormal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NeoTreeNormalNC guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NeoTreeEndOfBuffer guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NeoTreeWinSeparator guibg=NONE ctermbg=NONE")
  end,
}

