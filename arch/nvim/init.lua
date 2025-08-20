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
vim.keymap.set("n", "<leader>y", '"+y', { noremap = true, silent = true })
vim.keymap.set("v", "<leader>y", '"+y', { noremap = true, silent = true })

vim.keymap.set("n", "<leader>w", ":w<CR>", { desc = "Write file" })
vim.keymap.set("n", "<leader>q", ":wq<CR>", { desc = "Write and quit" })
vim.keymap.set("n", "<leader>Q", ":q!<CR>", { desc = "Force quit" })

vim.keymap.set("n", "<leader>o", 'o<ESC>', { noremap = true, silent = true })
vim.keymap.set("n", "<leader>O", 'O<ESC>', { noremap = true, silent = true })

vim.keymap.set('n', '<S-u>', '<C-r>', { desc = 'Redo' })

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

-- agregar link de markdown con control k como obsidian
vim.keymap.set('n', '<C-k>', 'i[]()2hi', { noremap = true, silent = true })

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

vim.opt.fillchars:append({ eob = " " })

-- vim.cmd("command! Trix %s/ \\[Trix\\] //g")
-- vim.cmd("command! Bd %s/ (BD 1080p AV1) \\[[^]]*\\]//g")
-- vim.cmd("command! Corchetes %s/ \[[^]]*\]//g")
