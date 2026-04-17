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

-- -- insert line above and below without leaving normal mode
-- vim.keymap.set("n", "<leader>o", 'o<ESC>', { noremap = true, silent = true })
-- vim.keymap.set("n", "<leader>O", 'O<ESC>', { noremap = true, silent = true })

-- U to redo
-- vim.keymap.set('n', '<S-u>', '<C-r>', { desc = 'Redo' })

-- identar todo el archivo
-- vim.keymap.set('n', '<leader>0', 'm`gg=G<Esc>``', { noremap = true, silent = true })

-- toggle markdown rendering
-- vim.keymap.set('n', '<leader>m', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true })

-- inserting checkboxes with control + c
-- vim.keymap.set('i', '<C-c>', '- [ ] ', { noremap = true, silent = true })

init.lua
___

-- Make background transparent
-- vim.o.termguicolors = false
-- vim.cmd [[highlight Normal ctermbg=none guibg=none]]
-- vim.cmd [[highlight NonText ctermbg=none guibg=none]]
-- vim.cmd [[highlight NormalNC ctermbg=none guibg=none]]
-- vim.cmd [[highlight MsgArea ctermbg=none guibg=none]]
-- vim.cmd [[highlight TelescopeNormal ctermbg=none guibg=none]]
-- vim.cmd [[highlight FloatBorder ctermbg=none guibg=none]]
-- vim.cmd [[highlight Pmenu ctermbg=none guibg=none]]
-- vim.cmd [[highlight StatusLine ctermbg=none guibg=none]]
