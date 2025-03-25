local wezterm = require("wezterm")

-- Hier das gewünschte Farbschema auswählen
local scheme_name = "everforest"

-- Lade das Farbschema
local success, scheme = pcall(require, "colorschemes." .. scheme_name)
if not success then
  wezterm.log_error("Farb-Schema '" .. scheme_name .. "' konnte nicht geladen werden: " .. scheme)
  scheme = {}
end

local color_palette = require("colorschemes.everforest").color_palette

return scheme

