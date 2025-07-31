local keymap = vim.api.nvim_set_keymap
keymap('n', '<c-s>', ':w<CR>', {})
keymap('i', '<c-s>', '<Esc>:w<CR>a', {})

-- tree
vim.keymap.set("n", "<C-b>", function()
  local view = require("nvim-tree.view")
  -- Check if the tree is open
  if view.is_visible() then
    -- If the current window is already the tree, then toggle it (close it)
    if vim.api.nvim_get_current_win() == view.get_winnr() then
      require("nvim-tree.api").tree.toggle({ focus = true })
    else
      -- Otherwise, just focus the tree window
      require("nvim-tree.api").tree.focus()
    end
  else
    -- If the tree is not open, toggle it open (with focus)
    require("nvim-tree.api").tree.toggle({ focus = true })
  end
end, { desc = "Toggle and focus nvim-tree" })

-- toggle checkbox
vim.keymap.set("n", "<A-c>", ":lua require('toggle-checkbox').toggle()<CR>")
