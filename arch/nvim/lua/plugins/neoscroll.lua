vim.pack.add({
	{ src = "https://github.com/karb94/neoscroll.nvim" },
})

require("neoscroll").setup({
    duration_multiplier = 1.0, 
    -- post_hook = function()
    --     vim.cmd('normal! zz')
    --   end
})
