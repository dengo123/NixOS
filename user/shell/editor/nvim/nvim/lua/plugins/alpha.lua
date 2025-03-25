return {
  "goolord/alpha-nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },

  config = function()
    local dashboard = require("alpha.themes.dashboard")

    dashboard.section.header.val = {
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                     ]],
      [[       ████ ██████           █████      ██                     ]],
      [[      ███████████             █████                             ]],
      [[      █████████ ███████████████████ ███   ███████████   ]],
      [[     █████████  ███    █████████████ █████ ██████████████   ]],
      [[    █████████ ██████████ █████████ █████ █████ ████ █████   ]],
      [[  ███████████ ███    ███ █████████ █████ █████ ████ █████  ]],
      [[ ██████  █████████████████████ ████ █████ █████ ████ ██████ ]],
      [[                                                                       ]],
      [[                                                                       ]],
      [[                                                                       ]],
    }
    -- Buttons
    dashboard.section.buttons.val = {
      dashboard.button("e", "  New File", ":ene <BAR> startinsert <CR>"),
      dashboard.button("f", "󰱼  Find File", ":Telescope find_files<CR>"),
      dashboard.button("r", "󰄉  Recent", ":Telescope oldfiles<CR>"),
      dashboard.button("q", "  Quit", ":qa<CR>"),
    }

    -- Footer
    dashboard.section.footer.val = {
      "┳┓┓┏  ┏┳┓┓┏┏┓  ┓ ┏┏┓┓┏",
      "┣┫┗┫   ┃ ┣┫┣   ┃┃┃┣┫┗┫",
      "┻┛┗┛   ┻ ┛┗┗┛  ┗┻┛┛┗┗┛",
    }
    require("alpha").setup(dashboard.opts)
  end,
}
