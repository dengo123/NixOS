return {
	"neanias/everforest-nvim",
	lazy = false,
	name = "everforest",
	priority = 1000,
	config = function()
    -- Aktiviert Transparenz im Everforest-Theme
    vim.g.everforest_transparent_background = 1
		vim.cmd.colorscheme "everforest"

    -- Explizite Transparenz für UI-Elemente setzen
    vim.cmd("highlight Normal guibg=NONE ctermbg=NONE")
    vim.cmd("highlight NonText guibg=NONE ctermbg=NONE")
    vim.cmd("highlight LineNr guibg=NONE")
    vim.cmd("highlight Folded guibg=NONE")
    vim.cmd("highlight EndOfBuffer guibg=NONE")
	end,
}

