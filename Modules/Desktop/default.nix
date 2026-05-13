{ pkgs, ... }:

{
    imports = [
        ./Hyprland
        ./Hyprpaper
        ./Shell
        ./Kitty
    ];

    home.packages = [
        pkgs.firefox
    ];

}