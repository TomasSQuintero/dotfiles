vim.pack.add({
	{ src = "https://github.com/sainnhe/gruvbox-material" },
})

vim.g.gruvbox_material_background = 'soft'
vim.g.gruvbox_material_foreground = 'material'

local default_color = "gruvbox-material"
vim.cmd('colorscheme ' .. default_color)
