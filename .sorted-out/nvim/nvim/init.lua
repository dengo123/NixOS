-- Optionen laden
require("vim-options")

-- Autocmds
vim.cmd("autocmd! BufReadPost *.cl")
vim.cmd("autocmd! BufReadPost *.zig")
vim.cmd("autocmd! BufReadPost *.g")

-- Stylix-Farben laden
local colors = require("colors")

-- Beispiel-Highlights
vim.api.nvim_set_hl(0, "Normal", { fg = colors.base05, bg = colors.base00 })
vim.api.nvim_set_hl(0, "Comment", { fg = colors.base03, italic = true })

-- Lazy.nvim Setup
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  lockfile = vim.fn.stdpath("cache") .. "/lazy-lock.json",
  { import = "plugins" },
})

