{ lib, config, pkgs, ... }:

{
    options.desktopPackageBundleDesktopUtilities.enable = {
        type = lib.types.bool;
        default = false;
        description = "Set the package bundle containing software relating to desktop utilities";
    };

    config = lib.mkIf config.desktopPackageBundleDesktopUtilities.enable {
        home.packages = with pkgs; [
            gnome-calculator
            gnome-clocks
            gnome-weather
            gnome-disk-utility
            gnome-calendar
        ];
    };
}