{ username, ... }:

{
    home.file.".config/Wallpapers/" = {
        source = ../Wallpapers;
        recursive = true;
    };

    services.hyprpaper = {
        enable = true;
    
        # settings = {
        #     splash = false;

        #     wallpaper = [
        #         {
        #             monitor = "";
        #             path = "~/Pictures/Wallpapers/rainworld3.jpg";
        #         }
        #     ];
        # };

        settings = {
            splash = false;

            preload = [
                "home/${username}/.config/Wallpapers/currentWallpaper"
            ];
            wallpaper = [
                ",home/${username}/.config/Wallpapers/currentWallpaper"
            ];
        };
    };
}