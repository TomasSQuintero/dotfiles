require("config.lazy")

vim.o.termguicolors = false
-- Make background transparent
vim.cmd [[highlight Normal ctermbg=none guibg=none]]
vim.cmd [[highlight NonText ctermbg=none guibg=none]]
vim.cmd [[highlight NormalNC ctermbg=none guibg=none]]
vim.cmd [[highlight MsgArea ctermbg=none guibg=none]]
vim.cmd [[highlight TelescopeNormal ctermbg=none guibg=none]]
vim.cmd [[highlight FloatBorder ctermbg=none guibg=none]]
vim.cmd [[highlight Pmenu ctermbg=none guibg=none]]
vim.cmd [[highlight StatusLine ctermbg=none guibg=none]]
vim.cmd("syntax on")

-- Line numbers
vim.opt.number = true
vim.opt.relativenumber = true

-- Tabs and indentation
vim.opt.tabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.smartindent = true

-- Search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

-- remaps
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>x", ":q!<CR>", { desc = "Force quit" })

-- clipboard
vim.opt.clipboard = "unnamedplus"
vim.g.clipboard = {
  name = "wl-clipboard",
  copy = {
    ["+"] = "wl-copy --foreground --type text/plain",
    ["*"] = "wl-copy --foreground --primary --type text/plain",
  },
  paste = {
    ["+"] = function()
      return vim.fn.systemlist("wl-paste --no-newline", {""}, 1)
    end,
    ["*"] = function()
      return vim.fn.systemlist("wl-paste --primary --no-newline", {""}, 1)
    end,
  },
  cache_enabled = true,
}

