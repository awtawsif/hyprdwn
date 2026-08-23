--
-- Look and Feel Configuration
--
-- This file contains settings related to the visual appearance of Hyprland.
-- This includes gaps, borders, rounding, shadows, and animations.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Variables/
--

hl.config({
    general = {
        gaps_in = 3,
        gaps_out = 3,
        border_size = 3,
        col = {
            active_border = { colors = { "rgb(7aa2f7)", "rgb(bb9af7)" }, angle = 45 },
            inactive_border = "rgb(3b4261)",
        },
        layout = "dwindle",
        resize_on_border = true,
        snap = {
            enabled = true,
        },
    },

    decoration = {
        rounding = 12,
        active_opacity = 0.95,
        inactive_opacity = 0.95,
        blur = {
            enabled = false,
        },
        shadow = {
            enabled = false,
        },
    },

    animations = {
        enabled = true,
    },

    misc = {
        disable_hyprland_logo = true,
        disable_splash_rendering = true,
        animate_manual_resizes = true,
        animate_mouse_windowdragging = false,
    },

    xwayland = {
        force_zero_scaling = true,
    },
})

-- Bezier curve: myEase, 0.05, 0.9, 0.1, 1.05
hl.curve("myEase", {
    type = "bezier",
    points = { { 0.05, 0.9 }, { 0.1, 1.05 } },
})

hl.animation({ leaf = "windows", enabled = true, speed = 7, bezier = "myEase" })
hl.animation({ leaf = "fade", enabled = true, speed = 4, bezier = "default" })
hl.animation({ leaf = "fadeOut", enabled = true, speed = 6, bezier = "default" })
hl.animation({ leaf = "workspaces", enabled = true, speed = 5, bezier = "myEase" })

