-- Theme Manager
local thememanager = {}

-- Liste der verfügbaren Themes
thememanager.themes = {
  catppuccin = require("plugins.themes.catppuccin"),
  everforest = require("plugins.themes.everforest"),
  gruvbox = require("plugins.themes.gruvbox"),
}

-- Aktuelles Theme auswählen
thememanager.active_theme = "everforest" -- Ändere dies nach Belieben

-- Funktion, um das aktive Theme zu laden
function thememanager.load()
  return thememanager.themes[thememanager.active_theme]
end

return thememanager

