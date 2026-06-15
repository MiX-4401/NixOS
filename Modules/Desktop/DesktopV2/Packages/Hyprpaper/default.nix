{ pkgs, ... }:

{

    options.dekstopHyprpaper.wallpaper = lib.mkOption {
        type = lib.types.listOf lib.types.str;
        default = [ "/home/${username}/Pictures/Wallpapers/rainworld2.png" ];
        description = "Set the Hyprpaper wallpaper";
    };

    config = {
        home.packages = with pkgs; [ hyprpaper ];

        home.file."/Pictures/Wallpapers/" = {
            source = ../Wallpapers;
            recursive = true;
        };

        services.hyprpaper = {
            enable = true;
            settings = {
                splash = false;

                preload = config.desktopHyprpaper.wallpaper;
                wallpaper = config.desktopHyprpaper.wallpaper;
            };
        };
    };
}