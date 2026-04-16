keybinds.lua
___
-- leader d to insert the date, already formatted
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> - ", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> ", { noremap = true, silent = true })
-- vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR><Esc>", { noremap = true, silent = true })

-- unused, Switch to the next split using 'gs'
-- vim.keymap.set('n', 'gs', '<C-w>w', { noremap = true, silent = true })

-- not working, formatting markdown link
-- vim.keymap.set('v', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })

-- unused, paste to end and return cursor
-- vim.keymap.set('n', '<leader>m', "ddGp''", { noremap = true })

-- deprecated, leader y to paste to clipboard
-- vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- deprecated, literally no idea what this one was for
-- vim.keymap.set('n', '<leader>p', 'llpo[]()2hi', { noremap = true, silent = true })
