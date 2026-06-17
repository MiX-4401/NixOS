{ config, pkgs, desktopSetWallpaper, ... }:

{
    home.packages = with pkgs; [ hyprpaper ];

    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;

            preload = [ "${desktopSetWallpaper.wallpaper}" ];
            wallpaper = [ "${desktopSetWallpaper.wallpaper}" ];
        };
    };
}