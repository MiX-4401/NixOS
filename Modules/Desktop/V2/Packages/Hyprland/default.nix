{ pkgs, lib, config, ... }:

{

    options.desktop.hyprland.sensitivity = lib.mkOption {
        type = lib.types.float;
        default = 0.0;
        description = "Mouse and touchpad sensitivity";
    };

    options.desktop.hyprland.scrollFactor = lib.mkOption {
        type = lib.types.float;
        default = 0.0;
        description = "Mouse and touchpad scroll factor";
    };

    options.desktop.hyprland.monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ", preferred, auto, 1" ];
        description = "Monitor settings";
    };

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
                require("default")
            '';

            # Variable settings
            settings.config = {

                # Input
                input = {
                    # Mouse settings
                    input.sensitivity = config.desktop.hyprland.sensitivity;
                    input.scroll_factor = config.desktop.hyprland.scrollFactor;
                    
                    # Touchpad settings
                    input.touchpad.scroll_factor = config.desktop.hyprland.scrollFactor;
                };

                # Monitors
                monitor = [ "HDMI-A-1,1920x1080@75,auto,1.2" "DP-1,1920x1080@144,0x0,1.2" ]; # Right, left monitors;
            };
        };
    };
}