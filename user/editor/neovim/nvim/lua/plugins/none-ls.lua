return {
	"nvimtools/none-ls.nvim",
	dependencies = {
		"jay-babu/mason-null-ls.nvim", -- Integration zwischen Mason und Null-LS
		"williamboman/mason.nvim",
	},
	config = function()
		local null_ls = require("null-ls")
		local mason_null_ls = require("mason-null-ls")

		-- Konfiguration von Mason-Null-LS
		mason_null_ls.setup({
			ensure_installed = { "flake8", "jsonlint", "eslint_d", "taplo" }, -- Liste der Tools
			automatic_installation = true,
		})

		-- Null-LS Konfiguration
		null_ls.setup({
			sources = {
				-- Lua
				null_ls.builtins.formatting.stylua,

				-- Python
				null_ls.builtins.formatting.black,

				-- JSON
				null_ls.builtins.formatting.prettier,

			},
		})

		-- Keybinding für Formatierung
		vim.keymap.set("n", "<leader>gf", vim.lsp.buf.format, { desc = "Format document" })
	end,
}

