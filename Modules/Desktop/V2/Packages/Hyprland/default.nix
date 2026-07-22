{ pkgs, lib, config, ... }:

{

    options.desktop.hyprland.sensitivity = lib.mkOption {
        type = lib.types.float;
        default = 0.0;
        description = "Mouse and touchpad sensitivity";
    };

    options.desktop.hyprland.monitors = lib.mkOption {
        type = lib.types.float;
        default = 0.2;
        description = "Mouse and touchpad sensitivity";
    };

    # options.desktop.hyprland.sensitivity = lib.mkOption {
    #     type = lib.types.float;
    #     default = 0.2;
    #     description = "Mouse and touchpad sensitivity";
    # };

    config = {

        # Source files
        home.file."/.config/hypr/" = {
            source = ./Configs;
            recursive = true;
        };

        # Hyprland sources
        wayland.windowManager.hyprland = {
            enable = true;
            configType = "lua";

            extraConfig = ''
                require("my")
            '';

            settings = {
                config = { 
                    
                    # Mouse settings
                    input = {
                        # Mouse
                        sensitivity = -0.2;
                        natural_scroll = false;
                        # force_no_accel = true;
                        scroll_factor = 0.0;
                        
                        # Keyboard
                        numlock_by_default = true;
                        
                        # Touchpad
                        touchpad.disable_while_typing = false;
                        touchpad.natural_scroll = false;
                        touchpad.scroll_factor = 0.0;
                    };
                };
            };
        };
    };
}