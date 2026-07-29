vim.pack.add({
  { src = "https://github.com/f-person/auto-dark-mode.nvim" },
})

local function apply_gruvbox()
  pcall(vim.cmd, "packadd gruvbox-material")
  vim.cmd("colorscheme gruvbox-material")
end

require("auto-dark-mode").setup({
  update_interval = 3000,
  fallback = "dark",
  set_dark_mode = function()
    vim.o.background = "dark"
    pcall(apply_gruvbox)
  end,
  set_light_mode = function()
    vim.o.background = "light"
    pcall(apply_gruvbox)
  end,
})
