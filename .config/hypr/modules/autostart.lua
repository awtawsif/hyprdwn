--
-- Autostart Configuration
--
-- This file contains applications and scripts that will be executed once when Hyprland starts.
--
-- For more information, see the Hyprland wiki:
-- https://wiki.hypr.land/Configuring/Autostart/
--

hl.on("hyprland.start", function()
    hl.exec_cmd("wayle panel start")
    hl.exec_cmd("mako")
    hl.exec_cmd("hyprctl setcursor Bibata-Modern-Classic 22")
    hl.exec_cmd("hypridle")
    hl.exec_cmd("awww-daemon")
    hl.exec_cmd([[awww img ~/.cache/boorupaper/current.jpg --transition-fps 60 --transition-duration 1]])
    hl.exec_cmd([[awww img ~/.cache/boorupaper/current.png --transition-fps 60 --transition-duration 1]])
    hl.exec_cmd("wl-paste --type text --watch cliphist store")
    hl.exec_cmd("nm-applet")
    hl.exec_cmd("blueman-applet")
    hl.exec_cmd("systemctl --user start hyprpolkitagent")
end)
