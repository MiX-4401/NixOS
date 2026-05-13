{ ... }:

{
    home.file."/Pictures/Wallpapers/" = {
        source = ./Wallpapers;
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
                "~/Pictures/Wallpapers/rainworld3.jpg"
            ];
            wallpaper = [
                ",~/Pictures/Wallpapers/rainworld3.jpg"
            ];
        };
    };
}