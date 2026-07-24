{ config, pkgs, username, wallpaper, ... }:

{
    home.packages = with pkgs; [ hyprpaper ];
    
    home.file."/Pictures/Wallpapers/" = {
        source = ../../../Wallpapers;
        recursive = true;
    };
    
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;

            wallpaper = [
                {
                    monitor = ",";
                    path = "/home/${username}/Pictures/Wallpapers/${wallpaper}";
                }
            ];
        };
    };
}