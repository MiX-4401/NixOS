{ pkgs, ... }:

{
    environment.systemPackages = with pkgs; [
        
        # Dep
        grim
        slurp

        # System
        timeshift
        ly

        # Desktop
        kitty
        # gnome-maps
        # gnome-music
        # gnome-notes
        # gnome-clocks
        # gnome-photos
        # gnome-weather
        # gnome-calendar
        # gnome-calculator
        # gnome-disk-utility
        hypridle
        hyprshot
        # hypr-dynamic-cursors
        # hyprland-workspaces
        
        # Terminal Programs
        nethogs
        btop
        cava
        cbonsai
        clipse
        ncdu

    ];

    programs = {

        # Helper
        git.enable = true;

        # System
        
        # Desktop
        hyprland.enable = true;
        hyprlock.enable = true;
                
        # Terminal Programs
        htop.enable = true;
        yazi.enable = true;
        nano.enable = true;
    };
}