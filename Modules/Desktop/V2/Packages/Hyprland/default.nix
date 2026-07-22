{ pkgs, lib, config, ... }:

{

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

        # settings = {
        #     # input.sensitivity = -1.0;
        #     "col.active_border" = lib.mkForce "rgb(${config.stylix.base16Scheme.base03}) rgb(${config.stylix.base16Scheme.base0A}) 45deg";
        # };
    };
}