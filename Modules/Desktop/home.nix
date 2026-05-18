{ username, pkgs, ... }:

{
    home.username = username;
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
        
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
        pkgs.btop
    ];
}