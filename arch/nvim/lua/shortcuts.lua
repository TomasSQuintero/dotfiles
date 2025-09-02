-- leader y to copy to clipboard
-- vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
-- vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

-- write, quit, and quit without saving
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>Q", ":qa!<CR>", { desc = "Force quit" })

-- insert line above and below without leaving normal mode
vim.keymap.set("n", "<leader>o", 'o<ESC>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>O", 'O<ESC>', { noremap = true, silent = true })

-- U to redo
vim.keymap.set('n', '<S-u>', '<C-r>', { desc = 'Redo' })

-- open oil file browser with -
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- agregar link de markdown con alt + k como obsidian
vim.keymap.set('n', '<A-k>', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('v', '<A-k>', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('i', '<A-k>', '[]()2hi', { noremap = true, silent = true })

-- inserting checkboxes with alt + c
vim.keymap.set('v', '<A-c>', ":norm I- [ ] <CR>A", { noremap = true, silent = true })
vim.keymap.set('i', '<A-c>', 'I- [ ] ', { noremap = true, silent = true })

-- toggle word wrap, on by default
vim.keymap.set('n', '<A-z>', ':set wrap!<CR>', { noremap = true, silent = true })

--para cerrar el buffer, para ir cambiando esta leader fb de telescope
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- find and replace (normal mode for entire file, visual only within selection)
vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Global search and replace", silent = false })
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>", { desc = "Search and replace in selection", silent = false })

--agregar ; al final de una linea en modo normal y volver a la pos. original
vim.keymap.set('n', '<leader>a', 'm`A;<Esc>``', { noremap = true, silent = true })

-- igual al anterior, pero utilizando visual block mode, dudoso
vim.keymap.set('x', '<leader>a', function()
local start_line = vim.fn.line("'<")
local end_line = vim.fn.line("'>")

for line = start_line, end_line do
local current = vim.fn.getline(line)
vim.fn.setline(line, current .. ';')
end
end, { noremap = true, silent = true })

-- identar todo el archivo
vim.keymap.set('n', '<leader>0', 'm`gg=G<Esc>``', { noremap = true, silent = true })

-- toggle markdown rendering
vim.keymap.set('n', '<leader>e', ':RenderMarkdown toggle<CR>', { noremap = true, silent = true })
