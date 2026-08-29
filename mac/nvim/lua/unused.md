keybinds.lua
___
leader d to insert the date, already formatted
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> - ", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> ", { noremap = true, silent = true })
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR><Esc>", { noremap = true, silent = true })

unused, Switch to the next split using 'gs'
vim.keymap.set('n', 'gs', '<C-w>w', { noremap = true, silent = true })

not working, formatting markdown link
vim.keymap.set('v', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })

unused, paste to end and return cursor
vim.keymap.set('n', '<leader>m', "ddGp''", { noremap = true })

deprecated, leader y to paste to clipboard
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

deprecated, literally no idea what this one was for
vim.keymap.set('n', '<leader>p', 'llpo[]()2hi', { noremap = true, silent = true })

markdown checkbox formatting
vim.keymap.set('v', '<A-c>', ":norm I- [ ] <CR>A", { noremap = true, silent = true })
vim.keymap.set('i', '<A-c>', 'I- [ ] ', { noremap = true, silent = true })

ara cerrar el buffer, para ir cambiando esta leader fb de telescope
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> - ", { noremap = true, silent = true })
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

increase/decrease number with alt a and x
vim.keymap.set('n', '<M-a>', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('v', '<M-a>', '<C-a>', { desc = 'Increment number' })
vim.keymap.set('v', 'g<M-a>', 'g<C-a>', { desc = 'Increment numbers sequentially' })

vim.keymap.set('n', '<M-x>', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('v', '<M-x>', '<C-x>', { desc = 'Decrement number' })
vim.keymap.set('v', 'g<M-x>', 'g<C-x>', { desc = 'Decrement numbers sequentially' })

