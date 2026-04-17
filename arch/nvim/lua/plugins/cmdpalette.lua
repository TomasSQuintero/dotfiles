vim.pack.add({
	{ src = "https://github.com/hachy/cmdpalette.nvim" },
})

require("cmdpalette").setup({
  win = {
    height = 0.3,
    width = 0.3,
    max_width = 120,
    border = "rounded",
    row_off = -2,
    title = "",
    title_pos = "center",
  },
  sign = {
    text = ":",
  },
  buf = {
    filetype = "vim",
    syntax = "vim",
  },
  delete_confirm = true,
  show_title = true,
})

vim.keymap.set("n", ":", "<Plug>(cmdpalette)")
