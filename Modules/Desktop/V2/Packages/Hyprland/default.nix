{ pkgs, lib, ... }:

{

    # Source files
    home.file."/.config/hypr/" = {
        source = "./Configs";
        recursive = true;
    };

    # Hyprland sources
    # wayland.windowManager.hyprland = {
    #     enable = true;
    #     configType = "lua";
        
    #     extraConfig = ""
        
    #     "";

    #     settings = {

    #     };
    # }
}