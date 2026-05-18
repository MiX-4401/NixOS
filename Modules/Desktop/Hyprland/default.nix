{ config, lib, ... }:

{
    wayland.windowManager.hyprland = {
        enable = true;
        # package = null;
        # portalPackage = null;

        extraConfig = 
            ''
            exec-once = hyprpaper
            '';

        settings = {

            # Monitor settings
            monitor = [ ",preferred,auto,auto" ];

            # General
            general = {
                gaps_in = 5;
                gaps_out = 20;
                border_size = 2;

                # "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg";
                # "col.inactive_border" = "rgba(595959aa)";
                # "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base00})";
                "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base08}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";
                
                resize_on_border = false; 
                allow_tearing = false;
                layout = "master";
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

            animation = { 
                enabled = true;
                
                # bezier = [
                #     "myBezier, 0.05, 0.9, 0.1, 1.05"
                # ];
                # animation = [
                #     "windows, 1, 7, myBezier"
                #     "windowsOut, 1, 7, default, popin 80%"
                #     "border, 1, 10, default"
                #     "borderangle, 1, 8, default"
                #     "fade, 1, 7, default"
                #     "workspaces, 1, 6, default"
                # ];

                bezier = [
                    "default, 0.12, 0.92, 0.08, 1.0"
                    "wind, 0.12, 0.92, 0.08, 1.0"
                    "overshot, 0.18, 0.95, 0.22, 1.03"
                    "liner, 1, 1, 1, 1"
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
            dwindle = {
                pseudotile = true;
                preserve_split = true; 
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
            };
    
            "$mainMod" = "SUPER"; 
            
            bind = [
                "$mainMod, Q, exec, kitty"
                "$mainMod, C, killactive,"
                "$mainMod, M, exit,"
                "$mainMod, E, exec, kitty yazi"
                "$mainMod, V, togglefloating,"
                "$mainMod, R, exec, $menu"
                "$mainMod, P, pseudo, "
                "$mainMod, J, togglesplit, "

                "$mainMod, left, movefocus, l"
                "$mainMod, right, movefocus, r"
                "$mainMod, up, movefocus, u"
                "$mainMod, down, movefocus, d"

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

                "$mainMod, S, togglespecialworkspace, magic"
                "$mainMod SHIFT, S, movetoworkspace, special:magic"

                "$mainMod, mouse_down, workspace, e+1"
                "$mainMod, mouse_up, workspace, e-1"
            ];

            bindm = [
                "$mainMod, mouse:272, movewindow"
                "$mainMod, mouse:273, resizewindow"
            ]; 
        };
    };
}