--
-- Gestures Configuration
--
-- This file contains settings for touchpad and touchscreen gestures.
--
-- Note: the old `gestures { workspace_swipe_* }` options were replaced by the
-- gesture API in Hyprland 0.55+.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Gestures/
--

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace",
})

hl.gesture({
    fingers = 3,
    direction = "vertical", -- try "up" / "down" if this is rejected by your version
    action = "fullscreen",
})
