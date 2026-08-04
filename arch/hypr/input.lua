hl.config({
    input = {
        kb_layout  = "latam",
        kb_variant = "",
        kb_model   = "",
        kb_options = "caps:escape_shifted_capslock,menu:super",
        kb_rules   = "",

        follow_mouse = 1,

        accel_profile = "custom 2 0.0 3.5 9.0",
        -- accel_profile = adaptive
        -- accel_profile = flat

        sensitivity = 0,
        numlock_by_default = true,
        scroll_factor = 1.0,
        natural_scroll = true
    },
})

hl.device({
    name           = "wacom-one-by-wacom-s-pen",
    output         = "HDMI-A-1",
    transform      = 4,
    relative_input = false,
    left_handed    = true,
})
