--
-- Keybindings Configuration
--
-- This file contains all your keybindings for Hyprland.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Basics/Binds/
--

-- Set programs that you use
local terminal = "alacritty"
local fileManager = "thunar"
local menu = "rofi -show drun"
local browser = "zen-browser"

hl.config({
    binds = {
        workspace_back_and_forth = true,
    },
})

-- Set modifier key to Window_Key
local mainMod = "SUPER"
local mainModShift = "SUPER + SHIFT"
local mainModCtrl = "SUPER + CTRL"

-- Set binding for opening apps
hl.bind(mainMod .. " + Return", hl.dsp.exec_cmd(terminal))
hl.bind(mainMod .. " + F", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + D", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + B", hl.dsp.exec_cmd(browser))

hl.bind(mainModShift .. " + Q", hl.dsp.window.close())
hl.bind(mainModShift .. " + E", hl.dsp.exit())
hl.bind(mainMod .. " + Space", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainModShift .. " + R", hl.dsp.exec_cmd("wayle panel restart & hyprctl reload"))
hl.bind(mainModShift .. " + F", hl.dsp.window.fullscreen({ mode = "fullscreen", action = "toggle" }))

-- Rotate Screen (toggle between normal and 180°)
hl.bind(mainModCtrl .. " + S", function()
    local mon = hl.get_monitor("eDP-1")
    if not mon then
        return
    end
    hl.monitor({ output = "eDP-1", transform = mon.transform == 2 and 0 or 2 })
end)

-- Set Wallpaper
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd([[~/Projects/boorupaper/boorupaper.sh --rating "s"]]))
hl.bind("ALT + R", hl.dsp.exec_cmd([[~/Projects/boorupaper/boorupaper.sh --rating "q"]]))
hl.bind("ALT + SHIFT + R", hl.dsp.exec_cmd([[~/Projects/boorupaper/boorupaper.sh --rating "e"]]))

-- Toggle KEYBIND (disable all keybinds)
hl.bind(mainModShift .. " + Backspace", hl.dsp.submap("clean"))
hl.define_submap("clean", function()
    hl.bind(mainModShift .. " + Backspace", hl.dsp.submap("reset"))
end)

-- Toggle WAYBAR
hl.bind(mainModShift .. " + Return", hl.dsp.exec_cmd("killall waybar || waybar"))

-- Take Screenshots
hl.bind("ALT + Print", hl.dsp.exec_cmd("hyprshot -m output -o ~/Pictures/Screenshots"))
hl.bind(mainMod .. " + Print", hl.dsp.exec_cmd("hyprshot -m window -o ~/Pictures/Screenshots"))
hl.bind(mainModShift .. " + Print", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- Move focus with mainMod + vim_motion
hl.bind(mainMod .. " + h", hl.dsp.focus({ direction = "l" }))
hl.bind(mainMod .. " + l", hl.dsp.focus({ direction = "r" }))
hl.bind(mainMod .. " + j", hl.dsp.focus({ direction = "u" }))
hl.bind(mainMod .. " + k", hl.dsp.focus({ direction = "d" }))

-- Move window with shift + mainMod + vim_motion
hl.bind(mainModShift .. " + h", hl.dsp.window.move({ direction = "l" }))
hl.bind(mainModShift .. " + l", hl.dsp.window.move({ direction = "r" }))
hl.bind(mainModShift .. " + j", hl.dsp.window.move({ direction = "u" }))
hl.bind(mainModShift .. " + k", hl.dsp.window.move({ direction = "d" }))

-- Switch workspaces with mainMod + [0-9]
for i = 1, 9 do
    local key = i % 10
    hl.bind(mainMod .. " + " .. key, hl.dsp.focus({ workspace = i}))
    hl.bind(mainModShift .. " + " .. key, hl.dsp.window.move({ workspace = i }))
end

-- Move active window to workspace 10 with mainMod + SHIFT + 0
hl.bind(mainModShift .. " + 0", hl.dsp.window.move({ workspace = "10" }))

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S", hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainModShift .. " + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up", hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { repeating = true, locked = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"), { repeating = true, locked = true })
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"), { repeating = true, locked = true })
hl.bind("XF86AudioMicMute", hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"), { repeating = true, locked = true })
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd(
    [[brightnessctl -e2 -n1920 set 5%+ && notify-send "Brightness" "$(brightnessctl -m | awk -F',' '{print $4}')"]]),
    { repeating = true, locked = true })
hl.bind("XF86MonBrightnessDown", hl.dsp.exec_cmd(
    [[brightnessctl -e2 -n1920 set 5%- && notify-send "Brightness" "$(brightnessctl -m | awk -F',' '{print $4}')"]]),
    { repeating = true, locked = true })

-- Requires playerctl
hl.bind("XF86AudioNext", hl.dsp.exec_cmd("playerctl next"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
