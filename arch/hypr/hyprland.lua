--  _                      _                 _   _             
-- | |__  _   _ _ __  _ __| | __ _ _ __   __| | | |_   _  __ _ 
-- | '_ \| | | | '_ \| '__| |/ _` | '_ \ / _` | | | | | |/ _` |
-- | | | | |_| | |_) | |  | | (_| | | | | (_| |_| | |_| | (_| |
-- |_| |_|\__, | .__/|_|  |_|\__,_|_| |_|\__,_(_)_|\__,_|\__,_|
--        |___/|_|                                             

hl.monitor({
    output   = "HDMI-A-1",
    mode     = "1920x1080@75",
    position = "0x0",
    scale    = 1,
})

hl.env("XCURSOR_THEME", "Bibata-Modern-Classic")
hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")

Terminal = "kitty"
FileManager = "thunar"
Menu = "rofi -show drun"
Windows = "rofi -show window"
Browser = "zen"
BrowserPrivate = "zen -private"
Wallpaper = "~/.config/hypr/wallpapers/forest.png"

-- autostart
hl.on("hyprland.start", function () 
    hl.exec_cmd('eval "$(ssh-agent -s)" & ssh-add ~/.ssh/id_ed25519')
    hl.exec_cmd("swaync & waybar")
    hl.exec_cmd("swaybg -i " .. Wallpaper .. " -m fill")
    hl.exec_cmd("systemctl --user start mpd-mpris")
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("wl-paste --type image --watch cliphist store")
end)

hl.config({
    misc = {
        focus_on_activate = true,
        vrr = 0,
        force_default_wallpaper = 0,
        disable_hyprland_logo   = true,
        disable_splash_rendering = true,
    },
})

require("animations")
require("input")
require("keybinds")
require("layout")
require("look-and-feel")
require("windows-and-workspaces")
-- require("permissions.lua")
