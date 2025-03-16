local color_palette = {
  obsidian = "#2f383e",
  obsidian_bright = "#4f5b58",
  blue = "#7fbbb3",
  blue_bright = "#b2d6d1",
  cyan = "#83c092",
  cyan_bright = "#b4d9bd",
  green = "#a7c080",
  green_bright = "#c1d2a6",
  white = "#d3c6aa",
  white_bright = "#e4dccc",
  magenta = "#d699b6",
  magenta_bright = "#e6c1d3",
  yellow = "#dbbc7f",
  yellow_bright = "#e9d6b2",
  red = "#e67e80",
  red_bright = "#f0b1b2",
  orange = "#e69875",
  orange_bright = "#f0c1ac",
}

local colors = {
  foreground = color_palette.white,
  background = color_palette.obsidian,
  cursor_bg = color_palette.orange,
  cursor_border = color_palette.orange,
  cursor_fg = color_palette.obsidian,
  selection_bg = color_palette.blue,
  selection_fg = color_palette.obsidian,

  ansi = {
    color_palette.obsidian,
    color_palette.red,
    color_palette.green,
    color_palette.yellow,
    color_palette.blue,
    color_palette.magenta,
    color_palette.cyan,
    color_palette.white,
  },
  brights = {
    color_palette.obsidian_bright,
    color_palette.red_bright,
    color_palette.green_bright,
    color_palette.yellow_bright,
    color_palette.blue_bright,
    color_palette.magenta_bright,
    color_palette.cyan_bright,
    color_palette.white_bright,
  },

  tab_bar = {
    background = color_palette.obsidian,
    active_tab = {
      bg_color = color_palette.cyan,
      fg_color = color_palette.obsidian,
    },
    inactive_tab = {
      bg_color = color_palette.obsidian_bright,
      fg_color = color_palette.white,
    },
    inactive_tab_hover = {
      bg_color = color_palette.blue,
      fg_color = color_palette.obsidian,
    },
    new_tab = {
      bg_color = color_palette.obsidian_bright,
      fg_color = color_palette.green,
    },
    new_tab_hover = {
      bg_color = color_palette.green,
      fg_color = color_palette.obsidian,
    },
  },
}

return colors

