{ lib, config, ... }:

{
    options = {
        core.system.misc.wallpaper.filename = lib.mkOption {
            type = lib.types.str;
            default = "rainworld2.png";
            description = "Set wallpaper for Hyprland and Stylix";
        };
    };
}