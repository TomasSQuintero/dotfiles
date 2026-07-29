-- Gruvbox Material (Dark, Soft contrast) theme for lualine
-- Normal = green, Visual = blue, others follow the gruvbox-material palette.
--
-- Install:
--   Save as lua/lualine/themes/gruvbox-material-dark-soft.lua in your config,
--   then in your lualine setup:
--     require('lualine').setup { options = { theme = 'gruvbox-material-dark-soft' } }
--
-- Or just require it directly:
--     options = { theme = require('gruvbox-material-dark-soft') }

local colors = {
  bg0     = '#32302f', -- soft background
  bg1     = '#3a3735',
  bg2     = '#45403d',
  bg3     = '#504945',
  bg4     = '#5a524c',
  fg0     = '#d4be98',
  fg1     = '#ddc7a1',
  gray    = '#a89984',

  red     = '#ea6962',
  orange  = '#e78a4e',
  yellow  = '#d8a657',
  green   = '#a9b665',
  aqua    = '#89b482',
  blue    = '#7daea3',
  purple  = '#d3869b',
}

local theme = {}

-- NORMAL: green
theme.normal = {
  a = { bg = colors.green, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3,   fg = colors.fg1 },
  c = { bg = colors.bg1,   fg = colors.fg0 },
}

-- INSERT: orange
theme.insert = {
  a = { bg = colors.orange, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3,    fg = colors.fg1 },
  c = { bg = colors.bg1,    fg = colors.fg0 },
}

-- VISUAL: blue
theme.visual = {
  a = { bg = colors.blue, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3,  fg = colors.fg1 },
  c = { bg = colors.bg1,  fg = colors.fg0 },
}

-- REPLACE: red
theme.replace = {
  a = { bg = colors.red, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3, fg = colors.fg1 },
  c = { bg = colors.bg1, fg = colors.fg0 },
}

-- COMMAND: yellow
theme.command = {
  a = { bg = colors.yellow, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3,    fg = colors.fg1 },
  c = { bg = colors.bg1,    fg = colors.fg0 },
}

-- TERMINAL: aqua (extra mode some configs use)
theme.terminal = {
  a = { bg = colors.aqua, fg = colors.bg0, gui = 'bold' },
  b = { bg = colors.bg3,  fg = colors.fg1 },
  c = { bg = colors.bg1,  fg = colors.fg0 },
}

-- INACTIVE
theme.inactive = {
  a = { bg = colors.bg1, fg = colors.gray },
  b = { bg = colors.bg1, fg = colors.gray },
  c = { bg = colors.bg1, fg = colors.gray },
}

return theme
