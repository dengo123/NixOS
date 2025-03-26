return {
  {
    "ellisonleao/gruvbox.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("gruvbox").setup({
        contrast = "soft",
        palette_overrides = {
          bright_green = "#b8bb26",
        },
      })
      vim.cmd.colorscheme "gruvbox"
    end
  }
}

