vim.pack.add({
	{ src = "https://github.com/neanias/everforest-nvim" },
})
require("everforest").setup({
  background = "medium",
})

local default_color = "everforest"
vim.cmd('colorscheme ' .. default_color)
