hl.on("hyprland.start", function()
    hl.exec_cmd("hypridle")         -- Idler service
    hl.exec_cmd("hyprpaper")        -- Wallpaper service
    hl.exec_cmd("clipse --listen")  -- Clipboard service
    hl.exec_cmd("waybar")           -- Statusbar service
    hl.exec_cmd("systemctl --user restart elephant.service") -- Fix issue with Elephant/Walker not working
end)
