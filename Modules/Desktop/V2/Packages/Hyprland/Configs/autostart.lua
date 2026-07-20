hl.on("hyprland.start", function())
    hl.exec_cmd("hypridle")         -- Idler service
    hl.exec_cmd("hyprpaper")        -- Wallpaper service
    hl.exec_cmd("clipse --listen")  -- Clipboard service
end)