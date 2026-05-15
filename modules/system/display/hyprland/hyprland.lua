-- Helloooo config
--
-- TODO: Figure out how to split config for desktop
hl.monitor({
    output = "DP-3",
    mode = "2560x1440@165",
    position = "1080x480",
})

hl.monitor({
    output = "HDMI-A-1",
    mode = "1920x1080@60",
    transform = 1,
})

-- Start workspace 1 on main monitor
hl.workspace_rule({
    workspace = "1",
    monitor = "DP-3",
})

hl.bind("mouse:277", hl.dsp.exec_cmd("pactl set-source-mute @DEFAULT_SOURCE@ toggle"))

-- --
-- The rest of this config is a rewrite of the old one
-- --
local terminal = "kitty";

hl.on("hyprland.start", function()
    hl.exec_cmd("waybar && hyprpaper")
    hl.exec_cmd("firefox", { workspace = "1" })
    hl.exec_cmd("vesktop", { workspace = "2" })
    hl.exec_cmd("spotify", { workspace = "special" })
end)

hl.env("LIBVA_DRIVER_NAME", "nvidia")
hl.env("__GLX_VENDOR_LIBRARY_NAME", "nvidia")
hl.env("ELECTRON_OZONE_PLATFORM_HINT", "auto")
hl.env("NIXOS_OZONE_WL", "1")
hl.env("HYORCURSOR_THEME", "rose-pine-hyprcursor")
hl.env("XDG_SESSION_TYPE", "wayland")
hl.env("XDG_CURRENT_DESKTOP", "Hyprland")
hl.env("GBM_BACKEND", "nvidia-drm")

hl.config({
    input = {
        accel_profile = "flat",
        follow_mouse = 2,
        numlock_by_default = true,
        sensitivity = 0,
    },

    general = {
        gaps_out = 10,
        resize_on_border = true,
        col = {
            active_border = "rgba(ffffff99)",
        },
    },

    decoration = {
        rounding = 3,
        inactive_opacity = 0.96,
        blur = {
            special = true,
            passes = 2
        },
        shadow = {
            enabled = true,
            range = 4,
            render_power = 3,
            color = 0xee1a1a1a,
        }
    },

    animations = {
        enabled = true,
    },

    dwindle = {
        preserve_split = true,
        smart_split = false,
    },

    misc = {
        force_default_wallpaper = -1,
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
    },

    binds = {
        drag_threshold = 10,
    },

    cursor = {
        inactive_timeout = 10,
        no_hardware_cursors = true,
    },

    debug = {
        disable_logs = false,
    },
})

hl.curve("quick", { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })
hl.curve("easeOutQuint", { type = "bezier", points = { { 0.25, 1 }, { 0.32, 1 } } })

hl.animation({ leaf = "workspaces", enabled = true, speed = 1.0, bezier = "quick", style = "slide" })
hl.animation({ leaf = "windows", enabled = true, speed = 2.0, bezier = "easeOutQuint" })
hl.animation({ leaf = "fade", enabled = true, speed = 1.7, bezier = "quick" })


local mod = "SUPER"

-- Basic actions
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + space", hl.dsp.exec_cmd("rofi -show run"))

-- Workspaces
for i = 1, 10 do
    local key = i % 10
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ workspace = i, on_current_monitor = true }))
    hl.bind(mod .. " + SHIFT + " .. key, hl.dsp.window.move({ workspace = i }))
end

hl.bind(mod .. " + F2", hl.dsp.focus({ workspace = "name:games" }))
hl.bind(mod .. " + SHIFT + F2", hl.dsp.window.move({ workspace = "name:games" }))
hl.bind("ALT + tab", hl.dsp.workspace.toggle_special())

-- Monitor and Focus
hl.bind(mod .. " + grave", hl.dsp.focus({ monitor = "+1" }))
hl.bind(mod .. " + tab", hl.dsp.window.cycle_next())
hl.bind(mod .. " + SHIFT + tab", hl.dsp.window.cycle_next({ next = false }))

-- Navigation (Vim-style and Arrows)
local directions = {
    h = "left",
    j = "down",
    k = "up",
    l = "right",
    left = "left",
    down = "down",
    up = "up",
    right = "right",
}
for key, dir in pairs(directions) do
    hl.bind(mod .. " + " .. key, hl.dsp.focus({ direction = dir }))
end

-- System and Window States
hl.bind(mod .. " + R", hl.dsp.dpms())
hl.bind(mod .. " + F", hl.dsp.window.fullscreen())
hl.bind(mod .. " + S", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mod .. " + P", hl.dsp.window.pin())

-- Apps
hl.bind(mod .. " + ALT + F", hl.dsp.exec_cmd("firefox"))
hl.bind(mod .. " + return", hl.dsp.exec_cmd(terminal))
hl.bind(mod .. " + period", hl.dsp.exec_cmd("smile"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("hyprshot -m region --clipboard-only"))
hl.bind("SHIFT + Print", hl.dsp.exec_cmd("hyprshot -m window -m active --clipboard-only"))
hl.bind("Control_L + Print", hl.dsp.exec_cmd("hyprshot -m output -m active --clipboard-only"))

-- Mouse
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Media
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })


hl.layer_rule({
    name = "Fix waybar blur",
    ignore_alpha = false,
    match = {
        namespace = "waybar",
    },
})

hl.window_rule({
    match = { class = "vesktop" },
    workspace = "2",
})

hl.window_rule({
    match = { class = "vesktop" },
    no_initial_focus = true,
})

hl.window_rule({
    match = { class = "Spotify" },
    workspace = "special",
})

hl.window_rule({
    match = { class = "Rofi" },
    stay_focused = true,
})

hl.window_rule({
    match = { content = "video" },
    opacity = 1,
})

hl.window_rule({
    match = { class = "it.mijorus.smile" },
    float = true,
})

hl.workspace_rule({
    workspace = "s[true]",
    gaps_out = 100,
})
