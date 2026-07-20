"$mainMod, M, exit,"
-- Primary programs
hl.bind("SUPER + T",    hp.dsp.exec_cmd("kitty"))
hl.bind("SUPER + E",    hp.dsp.exec_cmd("kitty yazi"))
hl.bind("SUPER + V",    hp.dsp.exec_cmd("zen"))
hl.bind("SUPER + A",    hp.dsp.exec_cmd("walker"))
hl.bind("SUPER + L",    hp.dsp.exec_cmd("hyprlock"))
hl.bind("SUPER + R",    hp.dsp.exec_cmd("gpu-screen-recorder-gtk"))
hl.bind("SUPER + S",    hp.dsp.exec_cmd("hyprshot -m region -o ~/Pictures/Screenshots"))

-- Secondary programs
hl.bind("SUPER + SHIFT + N",        hp.dsp.exec_cmd("kitty nmtui"))
hl.bind("SUPER + SHIFT + V",        hp.dsp.exec_cmd("kitty clipse"))
hl.bind("SUPER + SHIFT + P",        hp.dsp.exec_cmd("kitty jolt"))
hl.bind("SUPER + SHIFT + ESCAPE",   hp.dsp.exec_cmd("kitty btop"))

-- Windows navigation
hl.bind("SUPER + TAB",      cycle_next({ next }))
hl.bind("SUPER + up",       focus({ direction = "u" }))
hl.bind("SUPER + down",     focus({ direction = "d" }))
hl.bind("SUPER + left",     focus({ direction = "l" }))
hl.bind("SUPER + right",    focus({ direction = "r" }))
hl.bind("SUPER + 1",        focus( { workspace = "1" } ))
hl.bind("SUPER + 2",        focus( { workspace = "2" } ))
hl.bind("SUPER + 3",        focus( { workspace = "3" } ))
hl.bind("SUPER + 4",        focus( { workspace = "4" } ))
hl.bind("SUPER + 5",        focus( { workspace = "5" } ))
hl.bind("SUPER + 6",        focus( { workspace = "6" } ))
hl.bind("SUPER + 7",        focus( { workspace = "7" } ))
hl.bind("SUPER + 8",        focus( { workspace = "8" } ))
hl.bind("SUPER + 9",        focus( { workspace = "9" } ))

-- Window management
hl.bind("SUPER + Q",            close())
hl.bind("SUPER + SHIFT + Q",    kill())
hl.bind("SUPER + F",            fullscreen())
hl.bind("SUPER + RETURN",       swap({ target }))
hl.bind("SUPER + V",            float())
hl.bind("SUPER + SHIFT + 1",    hl.dsp.window.move({ workspace = "1" }))
hl.bind("SUPER + SHIFT + 2",    hl.dsp.window.move({ workspace = "2" }))
hl.bind("SUPER + SHIFT + 3",    hl.dsp.window.move({ workspace = "3" }))
hl.bind("SUPER + SHIFT + 4",    hl.dsp.window.move({ workspace = "4" }))
hl.bind("SUPER + SHIFT + 5",    hl.dsp.window.move({ workspace = "5" }))
hl.bind("SUPER + SHIFT + 6",    hl.dsp.window.move({ workspace = "6" }))
hl.bind("SUPER + SHIFT + 7",    hl.dsp.window.move({ workspace = "7" }))
hl.bind("SUPER + SHIFT + 8",    hl.dsp.window.move({ workspace = "8" }))
hl.bind("SUPER + SHIFT + 9",    hl.dsp.window.move({ workspace = "9" }))

-- Other
hl.bind("XF86MonBrightnessUp",      hl.dsp.exec_cmd("brightnessctl set +10%"))
hl.bind("XF86MonBrightnessDown",    hl.dsp.exec_cmd("brightnessctl set -10%"))
hl.bind("XF86AudioRaiseVolume",     hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"))
hl.bind("XF86AudioLowerVolume",     hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"))
hl.bind("XF86AudioMute",            hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"))
hl.bind("XF86AudioMicMute",         hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"))


--"$mainMod, mouse_down, workspace, e+1"--
--"$mainMod, mouse_up, workspace, e-1"




