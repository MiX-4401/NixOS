{ config, pkgs, ... }:

{
    home.packages = with pkgs; [ hyprpaper ];

    services.hyprpaper = {
        enable = true;
        settings = {
            splash = false;

            preload = [ config.desktopSetWallpaper.wallpaper ];
            wallpaper = [ config.desktopSetWallpaper.wallpaper ];
        };
    };
}