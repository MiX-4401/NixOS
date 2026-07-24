{ lib, config, ... }:

{
    options = {
        desktop.other.wallpaper = lib.mkOption {
            type = lib.types.str;
            default = "rainworld2.png";
            description = "Set wallpaper for Hyprland and Stylix";
        };
    };
}