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

-- Optionen laden
require("vim-options")

-- Theme-Manager importieren
local thememanager = require("thememanager")

-- Lazy.nvim Setup
require("lazy").setup({
  -- Themes explizit hinzufügen
  thememanager.load(),

  -- Plugins aus dem Verzeichnis 'plugins' einfügen
  { import = "plugins" },
})

-- Aktives Theme anwenden
local active_theme = thememanager.active_theme
if active_theme then
  vim.cmd.colorscheme(active_theme)
end

