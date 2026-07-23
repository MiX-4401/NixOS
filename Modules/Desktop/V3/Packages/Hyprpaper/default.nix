{ config, pkgs, username, desktopSetWallpaper, ... }:

{
    home.packages = with pkgs; [ hyprpaper ];
    
    home.file."/Pictures/Wallpapers/" = {
        source = ../../Wallpapers;
        recursive = true;
    };
    
    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;

            # preload = [ "${desktopSetWallpaper.wallpaper}" ];
            # wallpaper = [ "${desktopSetWallpaper.wallpaper}" ];
            # preload = [ "/home/${username}/Pictures/Wallpapers/${desktopSetWallpaper.wallpaper}" ];
            # preload = [ /home/ejradford/Pictures/Wallpapers/rainworld2.png ];
            # wallpaper = [ "/home/${username}/Pictures/Wallpapers/${desktopSetWallpaper.wallpaper}" ];
            wallpaper = [
                {
                    monitor = ",";
                    path = "/home/${username}/Pictures/Wallpapers/${desktopSetWallpaper.wallpaper}";
                }
                # {
                #     monitor = "DP-2";
                #     path = "/home/${username}/Pictures/Wallpapers/${desktopSetWallpaper.wallpaper}";
                # }
            ];
        };
    };
}