{ pkgs, lib, config, ... }:

# I have two places for Hyprland configs
# 1. Static configs - Inside of ./Configs
# 2. Variable configs - Can be changed by the hosts configuration.nix file

{

    options.desktop.hyprland.sensitivity = lib.mkOption {
        type = lib.types.float;
        default = -1.0;
        description = "Mouse and touchpad sensitivity";
    };

    options.desktop.hyprland.scrollFactor = lib.mkOption {
        type = lib.types.float;
        default = 1.0;
        description = "Mouse and touchpad scroll factor";
    };

    options.desktop.hyprland.monitors = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ ", preferred, auto, 1" ];
        description = "Monitor settings";
    };

    config = {

        # Source files
        home.file."/.config/hypr/Configs/" = {
            source = ./Configs;
            recursive = true;
        };

        # Hyprland sources
        wayland.windowManager.hyprland = {
            enable = true;
            configType = "lua";

            # Import hyprland configs
            extraConfig = ''
                require("Configs.default")
            '';

            # Variable settings
            settings = {
                
                # Monitors settings
                # monitor = desktop.hyprland.monitors;

                # Inputs settings
                config.input = {

                    # Mouse settings
                    sensitivity = config.desktop.hyprland.sensitivity;
                    scroll_factor = config.desktop.hyprland.scrollFactor;
                    
                    # Touchpad settings
                    touchpad.scroll_factor = config.desktop.hyprland.scrollFactor;
                };

                # Decoration settings
                config.general = {
                    col.active_border = lib.mkForce {
                        colors = [ "rgb(${config.stylix.base16Scheme.base03})" "rgb(${config.stylix.base16Scheme.base0B})" ];
                        angle = 45;
                    };
                    col.inactive_border = lib.mkForce {
                        colors = [ "rgb(${config.stylix.base16Scheme.base01})" "rgb(${config.stylix.base16Scheme.base02})" ];
                        angle = 45;
                    };
                };
                
                # Temp - to be removed
                monitor = [ 
                    {
                        output = "HDMI-A-1";
                        mode = "1920x1080@75";
                        position = "auto";
                        scale = 1.2;
                    }
                    {
                        output = "DP-1";
                        mode = "1920x1080@144";
                        position = "0x0";
                        scale = 1.2;
                    } 
                ];
            };
        };
    };
}

# monitor = [ 
#     {
#         output = "HDMI-A-1";
#         mode = "1920x1080@75";
#         position = "auto";
#         scale = 1.2;
#     }
#     {
#         output = "DP-1";
#         mode = "1920x1080@144";
#         position = "0x0";
#         scale = 1.2;
#     } 
# ];