return {
  "kyazdani42/nvim-web-devicons",
  config = function()
    require("nvim-web-devicons").setup({
      override = {
        zsh = {
          icon = "",
          color = "#428850",
          cterm_color = "65",
          name = "Zsh",
        },
      },
      default = true,
    })
  end,
}

