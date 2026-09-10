-- Hyprland Lua Configuration (Hyprland v0.55+)
-- Migrated from ~/.config/hypr/hyprland.conf

local mod = "SUPER"

--------------------------------------------------------------------------------
-- Input Settings
--------------------------------------------------------------------------------
hl.config({
    input = {
        sensitivity = -0.8,
        -- sensitivity = 0.2,
        follow_mouse = 1,
        repeat_delay = 210,
        repeat_rate = 40,
        kb_options = "caps:super",
    },
})

--------------------------------------------------------------------------------
-- Monitors Configuration
--------------------------------------------------------------------------------
-- Left monitor
hl.monitor({ output = "DP-4", mode = "1920x1080", position = "-1080x0", scale = 1, transform = 3 })
hl.monitor({ output = "DP-7", mode = "1920x1080", position = "-1080x0", scale = 1, transform = 3 })

-- Center monitor
hl.monitor({ output = "DP-5", mode = "1920x1080", position = "0x0", scale = 1 })
hl.monitor({ output = "DP-8", mode = "1920x1080", position = "0x0", scale = 1 })

-- Right monitor
hl.monitor({ output = "DP-6", mode = "2560x1440", position = "1920x0", scale = 1 })

--------------------------------------------------------------------------------
-- Workspace Monitor Assignments
--------------------------------------------------------------------------------
for i = 1, 6 do
    hl.workspace_rule({ workspace = tostring(i), monitor = "eDP-1" })
end
hl.workspace_rule({ workspace = "7", monitor = "DP-4" })
hl.workspace_rule({ workspace = "8", monitor = "DP-5" })
hl.workspace_rule({ workspace = "9", monitor = "DP-6" })

--------------------------------------------------------------------------------
-- Autostart Services
--------------------------------------------------------------------------------
hl.on("hyprland.start", function()
    hl.exec_cmd("restartwaybar")
    hl.exec_cmd("autoshutdown")
end)

--------------------------------------------------------------------------------
-- Look and Feel (General, Decoration, Dwindle, Misc)
--------------------------------------------------------------------------------
hl.config({
    general = {
        gaps_in = 5,
        gaps_out = 10,
        border_size = 3,
        col = {
            active_border = "rgba(9ccfd8ff)",
        },
        layout = "dwindle",
    },
    decoration = {
        rounding = 10,
        shadow = {
            enabled = false,
        },
        blur = {
            enabled = false,
        },
    },
    dwindle = {
        force_split = 2,
        preserve_split = true,
    },
    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        force_default_wallpaper = 0,
        disable_autoreload = false,
        enable_swallow = true,
        swallow_regex = "Alacritty",
    },
})

--------------------------------------------------------------------------------
-- Animations & Curves
--------------------------------------------------------------------------------
hl.curve("easeOutQuint",   { type = "bezier", points = { { 0.23, 1 }, { 0.32, 1 } } })
hl.curve("easeInOutCubic", { type = "bezier", points = { { 0.65, 0.05 }, { 0.36, 1 } } })
hl.curve("linear",         { type = "bezier", points = { { 0, 0 }, { 1, 1 } } })
hl.curve("almostLinear",   { type = "bezier", points = { { 0.5, 0.5 }, { 0.75, 1.0 } } })
hl.curve("quick",          { type = "bezier", points = { { 0.15, 0 }, { 0.1, 1 } } })

hl.animation({ leaf = "global",          enabled = true, speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",          enabled = true, speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",         enabled = true, speed = 4.79, bezier = "easeOutQuint" })
hl.animation({ leaf = "windowsIn",        enabled = true, speed = 4.1,  bezier = "easeOutQuint", style = "popin 87%" })
hl.animation({ leaf = "windowsOut",       enabled = true, speed = 1.49, bezier = "linear", style = "popin 87%" })
hl.animation({ leaf = "fadeIn",          enabled = true, speed = 1.73, bezier = "almostLinear" })
hl.animation({ leaf = "fadeOut",         enabled = true, speed = 1.46, bezier = "almostLinear" })
hl.animation({ leaf = "fade",            enabled = true, speed = 3.03, bezier = "quick" })
hl.animation({ leaf = "layers",          enabled = true, speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",        enabled = true, speed = 4,    bezier = "easeOutQuint", style = "fade" })
hl.animation({ leaf = "layersOut",       enabled = true, speed = 1.5,  bezier = "linear", style = "fade" })
hl.animation({ leaf = "fadeLayersIn",    enabled = true, speed = 1.79, bezier = "almostLinear" })
hl.animation({ leaf = "fadeLayersOut",   enabled = true, speed = 1.39, bezier = "almostLinear" })
hl.animation({ leaf = "workspaces",      enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesIn",     enabled = true, speed = 1.21, bezier = "almostLinear", style = "fade" })
hl.animation({ leaf = "workspacesOut",    enabled = true, speed = 1.94, bezier = "almostLinear", style = "fade" })

--------------------------------------------------------------------------------
-- Keybindings & Shortcuts
--------------------------------------------------------------------------------
-- Applications & Tools
hl.bind(mod .. " + RETURN", hl.dsp.exec_cmd("$TERMINAL"))
hl.bind(mod .. " + D", hl.dsp.exec_cmd("fuzzel"))
hl.bind(mod .. " + SHIFT + D", hl.dsp.exec_cmd([[.local/bin/$(ls .local/bin | dmenu-wl -p "> ")]]))

hl.bind(mod .. " + W", hl.dsp.exec_cmd("$BROWSER --password-store=basic 2>/dev/null"))
hl.bind(mod .. " + SHIFT + W", hl.dsp.exec_cmd("$BROWSER --incognito --password-store=basic 2>/dev/null"))

hl.bind(mod .. " + M", hl.dsp.exec_cmd("openmusic"))
hl.bind(mod .. " + SHIFT + M", hl.dsp.exec_cmd("openmusicdefault"))

hl.bind(mod .. " + C", hl.dsp.exec_cmd("signal-desktop --ozone-platform-hint=wayland"))

-- Window Controls
hl.bind(mod .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))
hl.bind(mod .. " + S", hl.dsp.window.fullscreen({ mode = "maximized", action = "toggle" }))
hl.bind(mod .. " + T", hl.dsp.layout("togglesplit"))
hl.bind(mod .. " + Q", hl.dsp.window.close())
hl.bind(mod .. " + SPACE", hl.dsp.window.float({ action = "toggle" }))

hl.bind(mod .. " + SHIFT + R", hl.dsp.exec_cmd("restartwaybar"))

hl.bind("Print", hl.dsp.exec_cmd("screenshot"))
hl.bind(mod .. " + SHIFT + S", hl.dsp.exec_cmd("screenshot"))

hl.bind(mod .. " + R", hl.dsp.exec_cmd("$TERMINAL -e newsboat"))
hl.bind(mod .. " + I", hl.dsp.exec_cmd("$TERMINAL -e nvim ~/docs/improvements"))

hl.bind(mod .. " + B", hl.dsp.exec_cmd("bookmarks"))
hl.bind(mod .. " + SHIFT + B", hl.dsp.exec_cmd("blueman-manager"))

hl.bind(mod .. " + Y", hl.dsp.exec_cmd("youtubesearch"))
hl.bind(mod .. " + E", hl.dsp.exec_cmd("emails"))

hl.bind(mod .. " + O", hl.dsp.exec_cmd("record-screen"))
-- hl.bind(mod .. " + A", hl.dsp.exec_cmd("webapp https://chatgpt.com"))
hl.bind(mod .. " + A", hl.dsp.exec_cmd("webapp https://claude.ai/"))
hl.bind(mod .. " + SHIFT + A", hl.dsp.exec_cmd("$TERMINAL -e agy"))
hl.bind(mod .. " + P", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind(mod .. " + N", hl.dsp.exec_cmd("emote"))

-- Media Controls (Volume & Brightness)
hl.bind("F5", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })
hl.bind("F6", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })

hl.bind("F1", hl.dsp.exec_cmd("setvolume toggle"))
hl.bind("F2", hl.dsp.exec_cmd("setvolume dec"), { repeating = true })
hl.bind("F3", hl.dsp.exec_cmd("setvolume inc"), { repeating = true })

-- Focus & Window Navigation
hl.bind(mod .. " + TAB", function()
    hl.dispatch(hl.dsp.focus({ window = "next" }))
    hl.dispatch(hl.dsp.window.bring_active_to_top())
end)

hl.bind(mod .. " + SHIFT + TAB", function()
    hl.dispatch(hl.dsp.focus({ window = "prev" }))
    hl.dispatch(hl.dsp.window.bring_active_to_top())
end)

hl.bind(mod .. " + H", hl.dsp.focus({ direction = "l" }))
hl.bind(mod .. " + L", hl.dsp.focus({ direction = "r" }))
hl.bind(mod .. " + K", hl.dsp.focus({ direction = "u" }))
hl.bind(mod .. " + J", hl.dsp.focus({ direction = "d" }))

-- Window Movement
hl.bind(mod .. " + SHIFT + H", hl.dsp.window.move({ direction = "l" }))
hl.bind(mod .. " + SHIFT + L", hl.dsp.window.move({ direction = "r" }))
hl.bind(mod .. " + SHIFT + K", hl.dsp.window.move({ direction = "u" }))
hl.bind(mod .. " + SHIFT + J", hl.dsp.window.move({ direction = "d" }))

-- Preselect New Window Direction
hl.bind(mod .. " + CTRL + H", hl.dsp.layout("preselect l"))
hl.bind(mod .. " + CTRL + L", hl.dsp.layout("preselect r"))
hl.bind(mod .. " + CTRL + K", hl.dsp.layout("preselect u"))
hl.bind(mod .. " + CTRL + J", hl.dsp.layout("preselect d"))

-- Workspaces Navigation & Window Workspace Assignment
for i = 1, 9 do
    hl.bind(mod .. " + " .. i, hl.dsp.focus({ workspace = i }))
    hl.bind(mod .. " + SHIFT + " .. i, hl.dsp.window.move({ workspace = i, silent = true }))
end

-- Mouse Bindings (Move / Resize)
hl.bind(mod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })
