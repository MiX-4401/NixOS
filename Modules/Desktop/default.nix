{ pkgs, ... }:

{
    imports = [
        ./Stylix
        ./Hyprland
        ./Hyprpaper
        ./Shell
        ./Kitty
    ];

    home.packages = [
        pkgs.firefox
        pkgs.hyprpaper
        pkgs.hyprland
        pkgs.neofetch
        pkgs.gnome-calculator
    ];
}