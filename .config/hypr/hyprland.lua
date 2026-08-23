--
-- Hyprland Configuration (Lua)
--
-- This is the main configuration file for Hyprland.
-- It loads configuration from the modules directory.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/
--

-- Load the module files
require("modules/monitors")
require("modules/autostart")
require("modules/environment")
require("modules/look_and_feel")
require("modules/gestures")
require("modules/input")
require("modules/keybindings")
require("modules/window_rules")
require("modules/tabbed_windows")
require("modules/cursor")
