{ lib, ... }:

{
    imports = [
        ./home-manager.nix
        ./stylix.nix
    ];

    # Add settings for setting the wallpaper which Hyprland and Stylix pull from
    options.desktopSetWallpaper.wallpaper = lib.mkOption {
        type = lib.types.path;
        default = ./Packages/Wallpapers/rainworld2.png;
        description = "Set wallpaper for Hyprpaper and Stylix";
    };
}