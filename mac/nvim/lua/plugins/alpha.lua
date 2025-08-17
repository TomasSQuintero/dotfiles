-- ~/.config/nvim/lua/plugins/alpha.lua

return {
    "goolord/alpha-nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
        local alpha = require("alpha")
        local dashboard = require("alpha.themes.dashboard")

        dashboard.section.header.val = {
            [[      ⣀⣠⣤⣤⣤⣤⣀⡀]],
            [[   ⣠⣤⢶⣻⣿⣻⣿⣿⣿⣿⣿⣿⣦⣤⣀]],
            [[  ⣼⣺⢷⣻⣽⣾⣿⢿⣿⣷⣿⣿⢿⣿⣿⣿⣇]],
            [[⠠⡍⢾⣺⢽⡳⣻⡺⣽⢝⢗⢯⣻⢽⣻⣿⣿⣿⣿⢿⡄]],
            [[⡨⣖⢹⠜⢅⢫⢊⢎⠜⢌⠣⢑⠡⣹⡸⣜⣯⣿⢿⣻⣷]],
            [[⢜⢔⡹⡭⣪⢼⠽⠷⠧⣳⢘⢔⡝⠾⠽⢿⣷⣿⣟⢷⣟]],
            [[⢸⢘⢼⠿⠟⠁    ⠃⠑⡌  ⠈⠙⠿⣷⢽⣻]],
            [[⢌⠂⠅       ⣲⣢⢂     ⠈⣯⠏]],
            [[⠐⠨⡂     ⡀⡔⠋⢻⣤⡀    ⢸⣯⠇]],
            [[⠈⣕⠝⠒⠄⠄⠒⢉⠪   ⢿⠜⠑⠢⠠⡒⡺⣿⠖]],
            [[ ⠐⠅⠁⡀ ⠐⢔⠁   ⢀⢇⢌   ⠸⠕]],
            [[  ⠂⠄⠄⠨⣔⡝⠼⡄⠂⣦⡆⣿⣲⠐⠑⠁  ]],
            [[      ⠃⢫⢛⣙⡊⣜⣏⡝⣝⠆]],
            [[      ⠈⠈⠁⠁⠁⠈⠈⠊]],
--       [[ ⠀⠀⠀⠀⠀⠀⠀⠀⢀⣀⣀⣀⣀⣀⣀⠀⡀⢀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀ ]],
--       [[ ⣶⣶⣶⣶⣿⣿⣿⣿⣿⣿⣿⣿⣿⠟⣽⠃⠀⠀⠀⢼⠻⣿⣿⣟⣿⣿⣿⣿⣶⣶⣶⣶⣤⣤⣤⣤⣤ ]],
--       [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠏⠀⠀⠛⡶⢶⢺⠁⠀⠈⢿⣿⣿⣿⣿⣿⣿⣏⣿⣿⣿⣿⣿⣿⣿ ]],
--       [[ ⣯⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⡟⠀⠀⣤⠀⣀⣠⡛⣣⡀⠀⠈⢿⣿⣿⣻⣏⣿⣿⣿⣿⣿⣿⣟⣿⠿ ]],
--       [[ ⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿⠃⠀⠀⣳⣶⣿⣿⣷⣾⠱⠀⠀⠊⢿⠿⠿⢛⣽⣿⡿⢿⣿⣟⠿⠿⠿ ]],
--       [[ ⠉⠉⠉⠛⠛⠛⠋⠛⠛⠛⣧⠀⡀⠀⠀⢿⣿⣿⡿⠃⠀⠀⠀⠀⠀⠀⠀⠀⠁⠀⠀⠀⠀⠅⢀⢀⡀ ]],
--       [[ ⠔⠄⢀⡀⠀⠀⠀⠄⠐⠸⠿⡀⠀⠀⠀⢘⣿⢷⣇⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⢀⠀⠀⠰⣠⣇ ]],
--       [[ ⣷⣆⣴⣮⢻⡲⡲⠀⠁⠀⠀⠀⠀⠀⠀⠹⡿⠘⠋⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠀⠈⣀⡘⢷⣏ ]],
--       [[ ⣿⣿⣿⣗⠿⢈⠁⡀⠀⠁⠀⠀⠀⠀⠀⠀⠉⠀⠀⡀⠀⠀⠀⠀⠀⠀⠀⠀⠠⢀⠄⠀⠄⠈⢿⣮⢿ ]],
--       [[ ⣿⣟⡿⣾⠀⠀⠀⠀⠀⠀⠀⢀⡤⠄⠀⠀⠀⠀⠸⠁⢠⣦⣤⢀⠀⠀⠀⠀⠀⠀⠀⠀⠐⠀⠈⣿⠀ ]],
--       [[ ⣿⣿⠏⠁⢀⡇⠀⠀⠀⠀⠀⠀⡄⠀⠀⠀⠘⡏⣷⣵⡻⠃⠄⢴⣆⠀⠀⠀⠀⠀⠀⠀⠰⠀⣆⣷⣿ ]],
--       [[ ⣿⡿⣻⠗⠀⢠⠀⠀⠀⠀⠀⠃⠀⠀⠀⠀⢠⣤⣄⢰⣶⢯⣤⡈⠋⠀⠀⠀⠀⠀⠀⠀⠀⠆⠀⣿⣼ ]],
        }

        --Custom Shortcuts
        dashboard.section.buttons.val = {
            --dashboard.button("b", "  browse files", ":Yazi<CR>"),
            dashboard.button("f", "  find file", ":Telescope find_files<CR>"),
            dashboard.button("r", "  recent files", ":Telescope oldfiles<CR>"),
            dashboard.button("n", "  new file", ":ene <BAR> startinsert<CR>"),
            dashboard.button("c", "  config", ":e $MYVIMRC<CR>"),
            dashboard.button("q", "  quit", ":qa<CR>"),
        }

        --Optional Footer
        dashboard.section.footer.val = {
            "This is the first day of the rest of your life",
            "                   死を忘れるな               ",
            --
            --" これが、あなたの人生の残りの日の最初の日です。",
            --
            --"                       "
        }

        --Styling
        dashboard.section.header.opts.hl = "header"
        dashboard.section.buttons.opts.hl = "Keyword"
        dashboard.section.footer.opts.hl = "Comment"

        vim.api.nvim_set_hl(0, "header", { fg = "#565f89", bold = true })

        -- Disable scrolling on the alpha buffer
        vim.api.nvim_create_autocmd("User", {
            pattern = "AlphaReady",
            callback = function()
                vim.opt_local.scrolloff = 0
                vim.keymap.set("n", "<ScrollWheelUp>", "<Nop>", { buffer = true })
                vim.keymap.set("n", "<ScrollWheelDown>", "<Nop>", { buffer = true })
                vim.keymap.set("n", "<ScrollWheelLeft>", "<Nop>", { buffer = true })
                vim.keymap.set("n", "<ScrollWheelRight>", "<Nop>", { buffer = true })
            end,
        })

        alpha.setup(dashboard.opts)
    end,
}
