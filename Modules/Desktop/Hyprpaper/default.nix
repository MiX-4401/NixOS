{ ... }:

{
    home.file."/Pictures/Wallpapers/" = {
        source = "./Wallpapers/";
        recursive = true;
    };

    services.hyprpaper.settings = {
        enable = true;
        splash = false;

        wallpaper = [
            {
                monitor = "~/Pictures/Wallpaper/rainworld3.jpg";
                path = "~/Pictures/Wallpaper/rainworld3.jpg";
            }
        ];
    };
}