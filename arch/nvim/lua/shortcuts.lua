-- leader y to copy to clipboard
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })


vim.keymap.set("n", "<leader>o", 'o<ESC>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>O", 'O<ESC>', { noremap = true, silent = true })

-- U to redo
vim.keymap.set('n', '<S-u>', '<C-r>', { desc = 'Redo' })

-- open oil file browser
vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- agregar link de markdown con alt k como obsidian
-- vim.keymap.set('n', '<C-k>', 'i[]()2hi', { noremap = true, silent = true })
-- vim.keymap.set('v', '<C-k>', 'i[]()2hi', { noremap = true, silent = true })
-- vim.keymap.set('i', '<C-k>', '[]()2hi', { noremap = true, silent = true })
vim.keymap.set('n', '<A-k>', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '[]()2hi', { noremap = true, silent = true })

-- vim.keymap.set('n', '<A-c>', '0i- [ ] ', { noremap = true, silent = true })
vim.keymap.set('v', '<A-c>', ":norm I- [ ] <CR>A", { noremap = true, silent = true })
vim.keymap.set('i', '<A-c>', 'I- [ ] ', { noremap = true, silent = true })

-- toggle word wrap, on by default
-- vim.keymap.set('n', '<leader>z', ':set wrap!<CR>', { noremap = true, silent = true })
vim.keymap.set('n', '<A-z>', ':set wrap!<CR>', { noremap = true, silent = true })
