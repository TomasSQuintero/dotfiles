vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- save, quit and force quit
vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set({'n', 'v'}, "<leader>q", ":wq!<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>x", ":q!<CR>", { desc = "Force quit" })

-- launch Oil.nvim
vim.keymap.set("n", "<leader>-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- leader a to add ; to the end of the line, keep cursor in place
vim.keymap.set('n', '<leader>a', 'm`A;<Esc>``', { noremap = true, silent = true })

vim.keymap.set('x', '<leader>a', function()
  local start_line = vim.fn.line("'<")
  local end_line = vim.fn.line("'>")

  for line = start_line, end_line do
    local current = vim.fn.getline(line)
    vim.fn.setline(line, current .. ';')
  end
end, { noremap = true, silent = true })

-- yazi
vim.keymap.set('n', '<leader>y', ':Yazi<cr>', { noremap = true, silent = true })

-- Sorting
vim.keymap.set('v', '<leader>s', ":'<,'>sort<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<leader>S', ":'<,'>sort!<CR>", { noremap = true, silent = true })
vim.keymap.set('v', '<leader>m', ":'<,'>!shuf<CR>", { noremap = true, silent = true })

-- word wrap toggle
vim.keymap.set('n', '<leader>z', ':set wrap!<CR>', { noremap = true, silent = true })

-- search and replace
vim.keymap.set("n", "<leader>r", ":%s//g<Left><Left>", { desc = "Global search and replace", silent = false })
vim.keymap.set("v", "<leader>r", ":s/\\%V/g<Left><Left>", { desc = "Search and replace in selection", silent = false })

--para cerrar el buffer, para ir cambiando esta leader fb de telescope
vim.keymap.set('n', '<leader>bd', ':bd<CR>', { noremap = true, silent = true })

-- markdown link formatting
vim.keymap.set('n', '<leader>k', 'i[]()2hi', { noremap = true, silent = true })
vim.keymap.set('i', '<C-k>', '[]()2hi', { noremap = true, silent = true })

-- markdown checkbox formatting
vim.keymap.set('v', '<A-c>', ":norm I- [ ] <CR>A", { noremap = true, silent = true })
vim.keymap.set('i', '<A-c>', 'I- [ ] ', { noremap = true, silent = true })

-- yank link inside ()
vim.keymap.set('n', 'yl', ':norm $hyi(0<CR>', { noremap = true, silent = true })
vim.keymap.set('n', 'yL', 'yi(', { noremap = true, silent = true })

-- Control + a para seleccionar todo el archivo
vim.keymap.set('n', '<C-a>', 'ggVG', { noremap = true, silent = true })

-- leader d to insert the date, already formatted
vim.keymap.set('n', '<leader>d', "i<C-R>= strftime('%Y-%m-%d')<CR> - ", { noremap = true, silent = true })

-- paste over selected text without losing what you yanked
-- vim.keymap.set('x', '<leader>p', [["_dP]], { noremap = true, silent = true })
vim.keymap.set('x', 'p', [["_dP]], { noremap = true, silent = true })

-- delete without yanking
vim.keymap.set('x', '<leader>d', [["_d]], { noremap = true, silent = true })

-- move lines with J and K
vim.keymap.set('v', 'J', ":m '>+1<CR>gv=gv", { noremap = true, silent = true })
vim.keymap.set('v', 'K', ":m '<-2<CR>gv=gv", { noremap = true, silent = true })

-- indent while keeping selection
vim.keymap.set('v', '<', "<gv", { noremap = true, silent = true })
vim.keymap.set('v', '>', ">gv", { noremap = true, silent = true })

-- clear keybinds with ctrl c
vim.keymap.set({ "n", "v" }, "<C-h>", "<cmd>nohlsearch<CR>", { silent = true, desc = "Clear search highlight" })
