--everforest colors
local lightGray = "#aaaaaaaa"
local yellow = "#DBBC7FFF"
local aqua = "#83C092FF"
local blue = "#7FBBB3FF"
local green = "#A7C080FF"
local red = "#E67E80FF"
local blank = "#00000000"

--gruvbox colors
local gb_yellow = '#DBA657FF'
local gb_green = '#A9B665FF'
local gb_blue = '#7DAEA3FF'
local gb_aqua = '#89B482FF'

--misc colors
local nord_yellow = '#ebcb8b'
local tiger_yellow = '#BF9A65'
local vague_yellow = '#f3be7c'

hl.config({
    general = {
        gaps_in  = 4,
        gaps_out = 8,

        border_size = 3,
        col = {
            active_border   =  yellow ,
            -- active_border = { colors = { yellow, red }, angle = 45 },
            inactive_border =  blank ,
        },
        resize_on_border = false,

        allow_tearing = false,
        layout = "dwindle",
    },

    decoration = {
        rounding       = 10,
        rounding_power = 2,

        active_opacity   = 1.0,
        inactive_opacity = 1.0,

        shadow = {
            enabled      = false,
            range        = 4,
            render_power = 3,
            color        = 0xee1a1a1a,
        },

        blur = {
            enabled   = true,
            size      = 5,
            passes    = 3,
            vibrancy  = 0.1696,
            new_optimizations = true,
        },
    },
})
