-- Primary programs
hl.bind("SUPER + T", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("kitty yazi"))
hl.bind("SUPER + B", hl.dsp.exec_cmd("zen")) -- changed from V to avoid conflict
hl.bind("SUPER + A", hl.dsp.exec_cmd("walker"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + R", hl.dsp.exec_cmd("gpu-screen-recorder-gtk"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- Secondary programs
hl.bind("SUPER + SHIFT + N", hl.dsp.exec_cmd("kitty nmtui"))
hl.bind("SUPER + SHIFT + V", hl.dsp.exec_cmd("kitty clipse"))
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("kitty jolt"))
hl.bind("SUPER + SHIFT + ESCAPE", hl.dsp.exec_cmd("kitty btop"))

-- Window navigation
-- hl.bind("SUPER + TAB", hl.dsp.window.cycle_next( { tiled = true} ))
hl.bind("SUPER + UP",    hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + DOWN",  hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + LEFT",  hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + RIGHT", hl.dsp.focus({ direction = "right" }))

hl.bind("SUPER + 1", hl.dsp.focus({ workspace = "1" }))
hl.bind("SUPER + 2", hl.dsp.focus({ workspace = "2" }))
hl.bind("SUPER + 3", hl.dsp.focus({ workspace = "3" }))
hl.bind("SUPER + 4", hl.dsp.focus({ workspace = "4" }))
hl.bind("SUPER + 5", hl.dsp.focus({ workspace = "5" }))
hl.bind("SUPER + 6", hl.dsp.focus({ workspace = "6" }))
hl.bind("SUPER + 7", hl.dsp.focus({ workspace = "7" }))
hl.bind("SUPER + 8", hl.dsp.focus({ workspace = "8" }))
hl.bind("SUPER + 9", hl.dsp.focus({ workspace = "9" }))

-- Window management
hl.bind("SUPER + Q",            hl.dsp.window.close())
hl.bind("SUPER + SHIFT + Q",    hl.dsp.window.kill())
hl.bind("SUPER + F",            hl.dsp.window.fullscreen())
-- hl.bind("SUPER + RETURN",       hl.dsp.window.swap({ w }))
hl.bind("SUPER + V",            hl.dsp.window.float())

hl.bind("SUPER + SHIFT + 1", hl.dsp.window.move({ workspace = "1", follow = false }))
hl.bind("SUPER + SHIFT + 2", hl.dsp.window.move({ workspace = "2", follow = false }))
hl.bind("SUPER + SHIFT + 3", hl.dsp.window.move({ workspace = "3", follow = false }))
hl.bind("SUPER + SHIFT + 4", hl.dsp.window.move({ workspace = "4", follow = false }))
hl.bind("SUPER + SHIFT + 5", hl.dsp.window.move({ workspace = "5", follow = false }))
hl.bind("SUPER + SHIFT + 6", hl.dsp.window.move({ workspace = "6", follow = false }))
hl.bind("SUPER + SHIFT + 7", hl.dsp.window.move({ workspace = "7", follow = false }))
hl.bind("SUPER + SHIFT + 8", hl.dsp.window.move({ workspace = "8", follow = false }))
hl.bind("SUPER + SHIFT + 9", hl.dsp.window.move({ workspace = "9", follow = false }))

-- Hardware keys
hl.bind("XF86MonBrightnessUp",
    hl.dsp.exec_cmd("brightnessctl set +10%"))

hl.bind("XF86MonBrightnessDown",
    hl.dsp.exec_cmd("brightnessctl set 10%-"))

hl.bind("XF86AudioRaiseVolume",
    hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))

hl.bind("XF86AudioLowerVolume",
    hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))

hl.bind("XF86AudioMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))

hl.bind("XF86AudioMicMute",
    hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))

-- Mouse wheel workspaces
-- hl.bind("SUPER + mouse_down", hl.workspace("e+1"))
-- hl.bind("SUPER + mouse_up", hl.workspace("e-1"))