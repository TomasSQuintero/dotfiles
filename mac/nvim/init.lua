require("keybinds")
require("plugins")

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true
vim.opt.linebreak = true

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
-- vim.opt.showtabline = 2

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- clipboard
vim.opt.clipboard = "unnamedplus"

-- others
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = false
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false
vim.opt.title = true
vim.opt.titlestring = "%F"
vim.opt.fillchars:append({ eob = " " })
vim.opt.showmode = false
vim.opt.showcmd = false

vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=italic]])

-- corremos :PackUpdate para actualizar los plugins
-- aparece un buffer con los cambios a instalar
-- confirmamos con :w/:write
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})
