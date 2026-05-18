{ username, pkgs, ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
    programs.home-manager.enable = true;
        
    imports = [ 
        ./Hyprland  # Compositor
        ./Hyprpaper # Wallpaper engine
        ./Waypaper  # Wallapaper engine
        ./Shell     # Shell zsh
        ./Kitty     # Terminal
        ./Ashell    # StatusBar
        ./Walker    # App launcher
    ];

    home.packages = [
        pkgs.firefox
        pkgs.hyprpaper
        pkgs.hyprland
        pkgs.neofetch
        pkgs.ashell
        pkgs.walker
        pkgs.waypaper
    ];
}