{ ... }:

{
    home.file."/Pictures/Wallpapers/" = {
        source = ./Wallpapers;
        recursive = true;
    };

    services.hyprpaper = {
        enable = true;
    
        settings = {
            splash = false;

            wallpaper = [
                {
                    monitor = "";
                    path = "~/Pictures/Wallpaper/rainworld3.jpg";
                }
            ];
        };
    };
}