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
            configType = "lua";    # Latest version of Home-manager defaults this to "lua" if not set explicitly 
            
            # package = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;

            # extraConfig = 
            #     ''
            #     exec-once = hyprpaper
            #     exec-once = clipse -listen
            #     '';

            # };

            settings = {

                # Super key
                mod._var = "SUPER"; 

                # Monitor settings
                # monitor = config.desktopHyprland.monitors;
                monitor = [
                    {   # Right monitor
                        output = "HDMI-A-1";
                        mode = "1920x1080@75";
                        position = "auto";
                        scale = 1.2;
                    }
                    {   # Left monitor
                        output = "DP-1";
                        mode = "1920x1080@144";
                        position = "0x0";
                        scale = 1.2;
                    }
                ];
                
                xwayland = {
                    enabled = true;
                    force_zero_scaling = true;
                };

                # General
                general = {
                    gaps_in = 5;
                    gaps_out = 20;
                    border_size = 2;

                    col.active_border = lib.mkForce "rgb(${config.stylix.base16Scheme.base03}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";
                    col.inactive_border = lib.mkForce "rgb(${config.stylix.base16Scheme.base08}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";

                    resize_on_border = false; 
                    allow_tearing = false;
                    layout = config.desktopHyprland.windowLayout;
                }; 

                # Decorations
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

                # Animation
                animations = {       
                    enabled = true;         
                    # bezier = [
                    #     "default, 0.12, 0.92, 0.08, 1.0"
                    #     "wind, 0.12, 0.92, 0.08, 1.0"
                    #     "overshot, 0.18, 0.95, 0.22, 1.03"
                    #     "linear, 1, 1, 1, 1"
                    # ];

                    # animation = [
                    #     "windows, 1, 8, wind, slide"
                    #     "windowsIn, 1, 6, wind, slide"
                    #     "windowsOut, 1, 6, wind, slide"
                    #     "windowsMove, 1, 6, wind, slide"
                    #     "layers, 1, 4, wind, popin"
                    #     "fadeIn, 1, 1, wind"
                    #     "fadeOut, 1, 1, wind"
                    #     "fadeSwitch, 1, 7, wind"
                    #     "fadeShadow, 1, 7, wind"
                    #     "fadeDim, 1, 7, wind"
                    #     "fadeLayers, 1, 7, wind"
                    #     "workspaces, 1, 5, wind, slidevert"
                    #     "border, 1, 15, overshot"
                    #     "borderangle, 1, 15, linear, once"
                    # ];
                };

                # Inputs
                input = {
                    touchpad.natural_scroll = true;
                    force_no_accel = true;
                    float_switch_override_focus = 0;
                };

                # Master
                master = {
                    new_status = "slave";
                    allow_small_split = true;
                };

                # Misc
                misc = {
                    disable_hyprland_logo = true;
                    disable_splash_rendering = true;
                    animate_mouse_windowdragging = true;
                    enable_swallow = false;
                    animate_manual_resizes = true;
                };
        
                # Binds        
                bind = [
                    # Application shortcuts
                    {
                        _args = [
                        "SUPER + T"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty")'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + E"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("kitty yazi")'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + B"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("zen")'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + A"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("walker")'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + L"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("hyprlock")'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + R"
                        (lib.generators.mkLuaInline ''hl.dsp.exec_cmd("gpu-screen-recorder-gtk")'')
                        ];
                    }

                    # Window management
                    {
                        _args = [
                        "SUPER + Q"
                        (lib.generators.mkLuaInline ''hl.dsp.window.close()'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + F"
                        (lib.generators.mkLuaInline ''hl.dsp.window.fullscreen()'')
                        ];
                    }
                    {
                        _args = [
                        "SUPER + RETURN"
                        (lib.generators.mkLuaInline ''hl.dsp.layout.message("swapwithmaster")'')
                        ];
                    }
                ];
            };
        };
    };
}
