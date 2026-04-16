require("keybinds")
require("plugins")

-- Make background transparent
vim.o.termguicolors = false
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
vim.opt.linebreak = true

-- tabs and indentation
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.linebreak = true
-- vim.opt.showtabline = 2

-- search
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.incsearch = true
vim.opt.hlsearch = false

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

-- others
vim.opt.signcolumn = "yes"
vim.opt.cursorcolumn = false
vim.opt.undofile = true
vim.opt.winborder = "rounded"
vim.opt.wrap = false

vim.opt.fillchars:append({ eob = " " })

vim.api.nvim_create_user_command("Book", function()
  vim.cmd("0r ~/notes/96-templates/book.md")
end, {})

vim.cmd([[set mouse=]])
vim.cmd([[set noswapfile]])
vim.cmd([[hi @lsp.type.number gui=italic]])

-- corremos :PackUpdate para actualizar los plugins
-- aparece un buffer con los cambios a instalar
-- confirmamos con :w/:write
vim.api.nvim_create_user_command('PackUpdate', function()
  vim.pack.update()
end, {})
