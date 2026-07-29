local mainMod = "SUPER"

local terminal = "kitty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local windows = "rofi -show window"
local browser = "zen"
local browserPrivate = "zen -private"
local wallpaper = "~/.config/hypr/wallpapers/forest.png"

hl.bind(mainMod .. " + Q", hl.dsp.window.close())
hl.bind(mainMod .. " + F", hl.dsp.window.fullscreen({ mode = 1 }))
hl.bind(mainMod .. " + ALT + F", hl.dsp.window.fullscreen({ mode = "fullscreen" }))
hl.bind(mainMod .. " + SHIFT + F", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + P", hl.dsp.layout("togglesplit"))

hl.bind(mainMod .. " + space", hl.dsp.exec_cmd(menu))
hl.bind("ALT + space", hl.dsp.exec_cmd(windows))

hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + SHIFT + Return", hl.dsp.exec_cmd(terminal .. " -e yazi"))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd("[float; center] kitty -e bluetui"))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd("kitty -e rmpc"))
hl.bind(mainMod .. " + S", hl.dsp.exec_cmd("localsend"))

-- Move focus
hl.bind(mainMod .. " + h",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + k",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + j",  hl.dsp.focus({ direction = "down" }))

-- Move (swap) the active window within the layout
hl.bind(mainMod .. " + CTRL + h",  hl.dsp.window.move({ direction = "left" }))
hl.bind(mainMod .. " + CTRL + l", hl.dsp.window.move({ direction = "right" }))
hl.bind(mainMod .. " + CTRL + k",    hl.dsp.window.move({ direction = "up" }))
hl.bind(mainMod .. " + CTRL + j",  hl.dsp.window.move({ direction = "down" }))

-- Resize windows
local resizeUnit = 250
hl.bind(mainMod .. " + ALT + L", hl.dsp.window.resize({ x = resizeUnit, y = 0, relative=true }))
hl.bind(mainMod .. " + ALT + H", hl.dsp.window.resize({ x = -resizeUnit, y = 0, relative=true }))
hl.bind(mainMod .. " + ALT + K", hl.dsp.window.resize({ x = 0, y = -resizeUnit, relative=true }))
hl.bind(mainMod .. " + ALT + J", hl.dsp.window.resize({ x = 0, y = resizeUnit, relative=true }))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. " + ALT + " .. key, hl.dsp.window.move({ workspace = i, follow = false }))
end

-- Special workspace
hl.bind(mainMod .. " + M",         hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + SHIFT + M", hl.dsp.window.move({ workspace = "special:music" }))
hl.bind(mainMod .. " + ALT + SHIFT + M", hl.dsp.window.move({ workspace = "special:music", follow = false }))

hl.bind(mainMod .. " + Tab",         hl.dsp.workspace.toggle_special("music"))
hl.bind(mainMod .. " + SHIFT + Tab", hl.dsp.window.move({ workspace = "special:music" }))
hl.bind(mainMod .. " + ALT + Tab",   hl.dsp.window.move({ workspace = "special:music", follow = false }))

-- switching workspaces
hl.bind("mouse:275", hl.dsp.focus({ workspace = "e+1" }))
hl.bind("mouse:276", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + A", hl.dsp.focus({ workspace = "previous"}))
hl.bind(mainMod .. " + Prior", hl.dsp.focus({ workspace = "e-1" }))
hl.bind(mainMod .. " + Next", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- center
hl.bind(mainMod .. " + C ", hl.dsp.window.center())

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })

-- suspend
hl.bind("Insert", hl.dsp.exec_cmd("systemctl suspend"))
hl.bind("SHIFT + Insert", hl.dsp.exec_cmd("wlogout"))

-- volume control
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })

-- screenshots
-- bind = SUPER SHIFT, S, exec, sh -c 'grim -g "$(slurp)" - | tee ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy'
-- bind = CONTROL SUPER SHIFT, S, exec, grim ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png
hl.bind("SUPER + SHIFT + S", hl.dsp.exec_cmd(
  [[sh -c 'grim -g "$(slurp)" - | tee ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png | wl-copy']]
))
hl.bind("CONTROL + SUPER + SHIFT + S", hl.dsp.exec_cmd(
  "grim ~/Pictures/screenshots/screenshot-$(date +%Y-%m-%d_%H-%M-%S).png"
))

-- toggle waybar
hl.bind(mainMod .. " + W", hl.dsp.exec_cmd("pgrep waybar && killall waybar || waybar &"))

-- clipboard
hl.bind(mainMod .. " + V", hl.dsp.exec_cmd("cliphist list | rofi -dmenu | cliphist decode | wl-copy"))

-- kitty, zen and yazi
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("kitty -e yazi"), { locked = true, repeating = true })
hl.bind("SHIFT + XF86MonBrightnessDown",hl.dsp.exec_cmd(FileManager), { locked = true, repeating = true })

hl.bind(mainMod .. " + BackSpace",         hl.dsp.exec_cmd("zen-browser"))
hl.bind(mainMod .. " + SHIFT + BackSpace", hl.dsp.exec_cmd("zen-browser --private-window"))

-- animation/gaps toggle
local active = "#DBBC7FFF"
local inactive = "#1E2326"
hl.bind("SUPER + F1", function ()
    local game_mode = (hl.get_config("animations.enabled") == false)

    if game_mode then
        hl.exec_cmd("hyprctl reload")
        hl.exec_cmd("waybar")
        return
    end
    hl.exec_cmd("pkill waybar")
    hl.config({
        general = {
            gaps_in = 0, gaps_out = 0, -- Disable gaps  
            -- border_size = 0,
            col = {
                active_border   =  active ,
                -- active_border = { colors = { "rgba(33ccffee)", "rgba(00ff99ee)" }, angle = 45 },
                inactive_border =  inactive ,
            },
        },
        animations = {
            enabled = false, -- Disable animations
        },
        decoration = {
            -- shadow = { enabled = false },
            -- blur = { enabled = false },
            rounding = 0,
        }
    })
end)

-- numpad shortcuts
hl.bind("KP_Add",  hl.dsp.exec_cmd(terminal))
hl.bind("KP_0",      hl.dsp.exec_cmd(browser))
hl.bind("KP_Subtract", hl.dsp.window.close())

-- hl.bind("KP_Insert", hl.dsp.exec_cmd("zen-browser --new-window https://web.whatsapp.com"))
-- hl.bind("KP_Begin", hl.dsp.focus({ workspace = 5 }))
-- hl.bind("KP_Begin", hl.dsp.focus({ workspace = "previous"}))
--
-- hl.bind("KP_Left", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind("KP_Right", hl.dsp.focus({ workspace = "e+1" }))
--
-- hl.bind(mainMod .. " + SHIFT + H", hl.dsp.focus({ workspace = "e-1" }))
-- hl.bind(mainMod .. " + SHIFT + L", hl.dsp.focus({ workspace = "e+1" }))

-- hl.bind("XF86Calculator",hl.dsp.exec_cmd("zen-browser --private-window 'youtube.com'"), { locked = true, repeating = true })
-- hl.bind("XF86Calculator",hl.dsp.exec_cmd("zen-browser 'pinterest.com'"), { locked = true, repeating = true })
-- hl.bind("Mod5 + BackSpace",         hl.dsp.exec_cmd("zen-browser"))
-- hl.bind("Mod5 + SHIFT + BackSpace", hl.dsp.exec_cmd("zen-browser --private-window"))
-- hl.bind("Mod5 + Return",            hl.dsp.exec_cmd(terminal))

-- multiple monitors
-- Move window to next monitor
-- hl.bind(mainMod .. " + SHIFT + comma", hl.dsp.window.move_to_monitor({ monitor = "+1" }))
-- change monitor focus
-- hl.bind(mainMod .. " + comma", hl.dsp.monitor.focus({ monitor = "-1" }))
--
-- unused keys
-- - XF86MonBrightnessUp
-- - XF86Calculator
--
-- Laptop multimedia keys for volume and LCD brightness
-- hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
-- hl.bind("XF86Calculator", hl.dsp.exec_cmd("zen-browser https://youtube.com"))
