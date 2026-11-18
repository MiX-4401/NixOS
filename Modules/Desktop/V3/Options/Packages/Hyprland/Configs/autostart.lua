hl.on("hyprland.start", function()
    -- hl.exec_cmd("hypridle")         -- Idler service, not needed if services.hypridle.enable = true is set
    -- hl.exec_cmd("hyprpaper")        -- Wallpaper service, not needed if serivces.hyperpaper.enable = true is set
    hl.exec_cmd("clipse --listen")  -- Clipboard service
    hl.exec_cmd("waybar")           -- Statusbar service
    hl.exec_cmd("systemctl --user restart elephant.service") -- Fix issue with Elephant/Walker not working
end)
