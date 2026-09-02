hl.config({ 
    dwindle = { 
        preserve_split = true,
        force_split = 0,
        smart_split = false,
        smart_resizing = true,
        permanent_direction_override = false,
        special_scale_factor         = 1,
        split_width_multiplier       = 1,
        use_active_for_splits        = true,
        default_split_ratio          = 1,
        split_bias                   = 0,
        precise_mouse_move           = false,
    },
})

hl.config({ master = { new_status = "master", }, })

hl.config({ scrolling = { fullscreen_on_one_column = true, }, })
