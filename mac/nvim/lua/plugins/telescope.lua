vim.pack.add({
  { src = "https://github.com/nvim-telescope/telescope.nvim", tag = "0.1.8" },
  { src = "https://github.com/nvim-lua/plenary.nvim" },
})

local builtin = require('telescope.builtin')
local map = vim.keymap.set

-- Keymaps
map('n', '<leader>fa', function()
  builtin.find_files({ hidden = true })
end, { desc = '[F]ind [A]ll files including dotfiles' })

map('n', '<leader>ff', builtin.find_files, { desc = '[F]ind [F]iles' })
map('n', '<leader>fg', builtin.live_grep,  { desc = '[F]ind by [G]rep' })
map('n', '<leader>fb', builtin.buffers,    { desc = '[F]ind [B]uffers' })
map('n', '<leader>fr', builtin.oldfiles,   { desc = '[F]ind [R]ecents' })
map('n', '<leader>fh', builtin.help_tags,  { desc = '[F]ind [H]elp' })
