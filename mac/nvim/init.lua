require("config.lazy")

vim.cmd("syntax on")
vim.opt.termguicolors = true

-- line numbers
vim.opt.number = true
vim.opt.relativenumber = true
vim.opt.cursorline = true

-- tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- remaps
vim.g.mapleader = " "

vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>x", ":q!<CR>", { desc = "Force quit" })

vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
-- clipboard
vim.opt.clipboard = "unnamedplus"

vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Global search and replace", silent = false })
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>", { desc = "Search and replace in selection", silent = false })

vim.keymap.set('n', '<leader>a', 'm`A;<Esc>``', { noremap = true, silent = true })

vim.keymap.set('x', '<leader>a', function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  for line = start_line, end_line do
    local current = vim.fn.getline(line)
    vim.fn.setline(line, current .. ';')
  end
end, { noremap = true, silent = true })


vim.keymap.set('n', '<leader>t', ':set wrap!<CR>', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Global search and replace", silent = false })
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>", { desc = "Search and replace in selection", silent = false })

vim.keymap.set('n', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('v', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '[]()2hi', { noremap = true, silent = true })


vim.keymap.set('n', '<leader>p', 'llpo[]()2hi', { noremap = true, silent = true })
-- vim.keymap.set('v', '<leader>p', 'i[]()2hi', { noremap = true, silent = true })
-- vim.keymap.set('i', '<leader>p', 'llpo[]()2hi', { noremap = true, silent = true })
