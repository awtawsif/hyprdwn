--
-- Window Rules
--
-- This file contains rules for specific windows.
-- You can use these rules to set properties like floating, opacity, and size for individual windows.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Window-Rules/
--

-- Ignore maximize requests from apps. You'll probably like this.
hl.window_rule({
    match = { class = ".*" },
    suppress_event = "maximize",
})

hl.window_rule({
    match = { class = "firefox" },
    opacity = "1 override 1 override",
})

hl.layer_rule({
    match = { namespace = "rofi" },
    animation = "popin",
})

hl.layer_rule({
    match = { namespace = "rofi" },
    dim_around = true,
})

hl.window_rule({
    match = { class = "nm-connection-editor" },
    float = true,
})
hl.window_rule({
    match = { class = "nm-connection-editor" },
    opacity = "1 override 1 override",
})

hl.window_rule({
    match = { class = "blueman-manager" },
    float = true,
})
hl.window_rule({
    match = { class = "blueman-manager" },
    size = { 1200, 800 },
})
hl.window_rule({
    match = { class = "blueman-manager" },
    opacity = "1 override 1 override",
})

hl.window_rule({
    match = { title = "(.*)YouTube(.*)" },
    opacity = "1 override 1 override",
})
hl.window_rule({
    match = { title = "(.*)Minecraft(.*)" },
    opacity = "1 override 1 override",
})
hl.window_rule({
    match = { class = "gimp" },
    opacity = "1 override 1 override",
})

hl.window_rule({
    match = { class = "^(steam_app_.*)$" },
    fullscreen = true,
})
hl.window_rule({
    match = { class = "^(steam_app_.*)$" },
    immediate = true, -- disables compositor VSync, reduces input lag
})
