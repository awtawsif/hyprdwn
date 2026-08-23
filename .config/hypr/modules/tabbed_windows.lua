--
-- Tabbed Windows Configuration
--
-- This file contains settings for tabbed windows, also known as groups.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Grouping/
--

local mainMod = "SUPER"
local mainModShift = "SUPER + SHIFT"
local mainModShiftCtrl = "SUPER + SHIFT + CTRL"

hl.config({
    group = {
        -- Active Group Border (Accent Purple)
        col = {
            border_active = 0xff9d64e3,

            -- Inactive Group Border (Dark Gray)
            border_inactive = 0xff414868,

            -- Active Locked Group Border (Urgent Red/Pink)
            border_locked_active = 0xfff7768e,

            -- Inactive Locked Group Border (Darker Locked)
            border_locked_inactive = 0xff5e597c,
        },

        groupbar = {
            -- Enable the groupbar
            enabled = false,

            -- Appearance settings for a cleaner look
            render_titles = false,
            -- indicator_height = 2
            -- rounding = 15
            -- rounding_power = 0
            -- gaps_out = 0
            -- keep_upper_gap = false

            -- Groupbar Background Colors

            -- Active Group Bar Background (Accent Blue)
            -- col.active = 0xffff9e64

            -- Inactive Group Bar Background (Dark Gray)
            -- col.inactive = 0xff414868

            -- Active Locked Group Bar Background (Urgent Red/Pink)
            -- col.locked_active = 0xfff7768e

            -- Inactive Locked Group Bar Background (Darker Locked)
            -- col.locked_inactive = 0xff5e597c

            -- Text Colors

            -- Color for Active Window Title in Groupbar (Light Text)
            -- text_color = 0xffa9b1d6

            -- Color for Inactive Window Titles in Groupbar
            -- text_color_inactive = 0xff8b94b1
        },
    },
})

-- Creates a group
hl.bind(mainMod .. " + G", hl.dsp.group.toggle())

-- Moving focus on the next or previous window inside the group
hl.bind(mainMod .. " + q", hl.dsp.group.prev())
hl.bind(mainMod .. " + w", hl.dsp.group.next())

-- Swapping the active window with the next or previous in a group
hl.bind(mainModShift .. " + q", hl.dsp.group.move_window({ forward = false }))
hl.bind(mainModShift .. " + w", hl.dsp.group.move_window({ forward = true }))

-- Moving non-tabbed window inside tabbed group by direction
for _, dir in ipairs({ "l", "r", "u", "d" }) do
    local arrow = ({ l = "left", r = "right", u = "up", d = "down" })[dir]
    hl.bind(mainModShiftCtrl .. " + " .. arrow, hl.dsp.window.move({ into_group = dir }))
end

-- Moving tabbed window out from the group
for _, dir in ipairs({ "l", "r", "u", "d" }) do
    local arrow = ({ l = "left", r = "right", u = "up", d = "down" })[dir]
    hl.bind(mainModShift .. " + " .. arrow, hl.dsp.window.move({ out_of_group = dir }))
end
