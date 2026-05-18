{ username, pkgs, ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
    # programs.home-manager.enable = true;

    home.sessionVariables.WALLPAPER = /home/${username}/Pictures/Wallpapers/rainworld2.png
        
    imports = [ 
        ./Hyprland  # Compositor
        ./Hyprpaper # Wallpaper engine
        ./Waypaper  # Wallapaper engine
        ./Shell     # Shell zsh
        ./Kitty     # Terminal
        ./Ashell    # StatusBar
        ./Walker    # App launcher
        ./stylix.nix
    ];

    home.packages = [
        pkgs.firefox
        pkgs.hyprpaper
        pkgs.neofetch
        pkgs.ashell
        pkgs.walker
        pkgs.waypaper
    ];
}