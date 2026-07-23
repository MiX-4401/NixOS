{ inputs, pkgs, config, lib, ... }:

{
    options.desktopHyprland.monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ", preferred, auto, 1" ];
        description = "List of monitors as per Hyprland monitor config";
    };

    options.desktopHyprland.windowLayout = lib.mkOption {
        type = lib.types.str;
        default = "master";
        description = "Set the Hyprland window layout of either string 'dwindle' or 'master'";
    };

    config = {
        wayland.windowManager.hyprland = {
            enable = true;
            configType = "hyprlang";    # Latest version of Home-manager defaults this to "lua" if not set explicitly 
            
            package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;

            extraConfig = 
                ''
                exec-once = hyprpaper
                exec-once = clipse -listen
                '';

            
            plugins = [
                pkgs.hyprlandPlugins.hypr-dynamic-cursors
            ];

            settings = {

                # Plugin configs
                "plugin:hypr-dynamic-cursors" = {
                    enabled = true;
                    mode = "tilt";
                    threshold = 2;
                    rotate = {
                        length = 20;
                        offset = 0.0;
                    };

                    tilt = {
                        limit = 2000;
                        function = "negative_quadratic";
                        window = 100;
                    };

                    hyprcursor = {
                        nearest = true;
                        enabled = true;
                        resolution = -1;
                        fallback = "clientside";
                    };
                };

                # Monitor settings
                monitor = config.desktopHyprland.monitors;
                
                xwayland = {
                    force_zero_scaling = true;
                };

                # General
                general = {
                    gaps_in = 5;
                    gaps_out = 20;
                    border_size = 2;

                    "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base03}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";
                    "col.inactive_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base08}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";

                    resize_on_border = false; 
                    allow_tearing = false;
                    layout = config.desktopHyprland.windowLayout;
                }; 

                decoration = {
                    rounding = 5;
                    active_opacity = 0.8;
                    inactive_opacity = 0.7;

                    blur = {
                        enabled = true;
                        xray = true;
                        ignore_opacity = true;

                        size = 10;
                        passes = 4;
                        contrast = 2.0;
                        vibrancy =  0.0;
                        brightness = 0.4;
                        vibrancy_darkness = 1.0;
                        new_optimizations = true;
                    };

                    shadow = {
                        enabled = true;
                        range = 10;
                        render_power = 2;
                    };

                };

                animations = {       
                    enabled = true;         
                    bezier = [
                        "default, 0.12, 0.92, 0.08, 1.0"
                        "wind, 0.12, 0.92, 0.08, 1.0"
                        "overshot, 0.18, 0.95, 0.22, 1.03"
                        "linear, 1, 1, 1, 1"
                    ];

                    animation = [
                        "windows, 1, 8, wind, slide"
                        "windowsIn, 1, 6, wind, slide"
                        "windowsOut, 1, 6, wind, slide"
                        "windowsMove, 1, 6, wind, slide"
                        "layers, 1, 4, wind, popin"
                        "fadeIn, 1, 1, wind"
                        "fadeOut, 1, 1, wind"
                        "fadeSwitch, 1, 7, wind"
                        "fadeShadow, 1, 7, wind"
                        "fadeDim, 1, 7, wind"
                        "fadeLayers, 1, 7, wind"
                        "workspaces, 1, 5, wind, slidevert"
                        "border, 1, 15, overshot"
                        "borderangle, 1, 15, linear, once"
                    ];
                };

                input = {
                    touchpad.natural_scroll = true;
                    force_no_accel = true;
                    float_switch_override_focus = 0;
                };

                master = {
                    new_status = "slave";
                    allow_small_split = true;
                };

                misc = {
                    disable_hyprland_logo = true;
                    disable_splash_rendering = true;
                    animate_mouse_windowdragging = true;
                    enable_swallow = false;
                    animate_manual_resizes = true;
                };
        
                "$mainMod" = "SUPER"; 
                
                bind = [

                    # Application key shortcuts
                    "$mainMod, T, exec, kitty"
                    "$mainMod, E, exec, kitty yazi"
                    "$mainMod, B, exec, zen"
                    "$mainMod, A, exec, walker"
                    "$mainMod, L, exec, hyprlock"
                    "$mainMod, R, exec, gpu-screen-recorder-gtk"
                    
                    # Window management
                    "$mainMod, Q, killactive,"
                    "$mainMod, F, fullscreen"
                    "$mainMod, M, exit,"
                    "$mainMod, TAB, cyclenext"
                    "$mainMod, RETURN, layoutmsg, swapwithmaster"
                    "$mainMod, V, togglefloating,"
                    "$mainMod, P, pseudo, "

                    # Application shift key shortcuts
                    "$mainMod+SHIFT, N, exec, kitty --title nmtui nmtui"
                    "$mainMod+SHIFT, V, exec, kitty --title clipse clipse"
                    "$mainMod+SHIFT, P, exec, kitty --title jolt jolt"

                    # Window navigation
                    "$mainMod, left, movefocus, l"
                    "$mainMod, right, movefocus, r"
                    "$mainMod, up, movefocus, u"
                    "$mainMod, down, movefocus, d"

                    # Workspace navigation - keyboard
                    "$mainMod, 1, workspace, 1"
                    "$mainMod, 2, workspace, 2"
                    "$mainMod, 3, workspace, 3"
                    "$mainMod, 4, workspace, 4"
                    "$mainMod, 5, workspace, 5"
                    "$mainMod, 6, workspace, 6"
                    "$mainMod, 7, workspace, 7"
                    "$mainMod, 8, workspace, 8"
                    "$mainMod, 9, workspace, 9"
                    "$mainMod, 0, workspace, 10"
                    
                    # Workspace navigation mousebinds 
                    "$mainMod, mouse_down, workspace, e+1"
                    "$mainMod, mouse_up, workspace, e-1"

                    # Workspace management
                    "$mainMod SHIFT, 1, movetoworkspace, 1"
                    "$mainMod SHIFT, 2, movetoworkspace, 2"
                    "$mainMod SHIFT, 3, movetoworkspace, 3"
                    "$mainMod SHIFT, 4, movetoworkspace, 4"
                    "$mainMod SHIFT, 5, movetoworkspace, 5"
                    "$mainMod SHIFT, 6, movetoworkspace, 6"
                    "$mainMod SHIFT, 7, movetoworkspace, 7"
                    "$mainMod SHIFT, 8, movetoworkspace, 8"
                    "$mainMod SHIFT, 9, movetoworkspace, 9"
                    "$mainMod SHIFT, 0, movetoworkspace, 10"

                    # Special workspace
                    # "$mainMod, S, togglespecialworkspace, magic"
                    # "$mainMod SHIFT, S, movetoworkspace, special:magic"
                    "$mainMod SHIFT, S, exec, hyprshot -m region -o ~/Pictures/Screenshots"
                    
                    # Brightness keybinds
                    ",XF86MonBrightnessUp, exec, brightnessctl set +10%"
                    ",XF86MonBrightnessDown, exec, brightnessctl set 10%-"
                ];

                bindm = [
                    # Workspace navigation - mouse 
                    "$mainMod, mouse:272, movewindow"
                    "$mainMod SHIFT, mouse:272, resizewindow"
                ]; 

                bindel = [
                    # Volume keybinds
                    ",XF86AudioRaiseVolume, exec, wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"
                    ",XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"
                    ",XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"
                    ",XF86AudioMicMute, exec, wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"
                    
                    # # Brightness keybinds
                    # ",XF86MonBrightnessUp, exec, brightnessctl -e4 -n2 set 5%+"
                    # ",XF86MonBrightnessDown, exec, brightnessctl -e4 -n2 set 5%-"
                ];

                bindl = [
                    # Music keybinds
                    ",XF86AudioNext, exec, playerctl next"
                    ",XF86AudioPause, exec, playerctl play-pause"
                    ",XF86AudioPlay, exec, playerctl play-pause"
                    ",XF86AudioPrev, exec, playerctl previous"
                ];
            };
        };
    };
}
