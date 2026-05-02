{ pkgs, ... }:

{

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    time.timeZone = "Australia/Melbourne";

    # System
    system = {
        stateVersion = "24.05";
    }; 

    fonts.packages = [
        pkgs.noto-fonts
    ];

    environment.systemPackages = with pkgs; [
        
        # Helper
        grim
        slurp
        home-manager

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
        # hypridle
        # hyprshot
        # hypr-dynamic-cursors
        # hyprland-workspaces
        
        # Terminal Programs
        ncdu
        nethogs
        btop
        cava
        cbonsai
        clipse

    ];

    programs = {

        # Helper
        git.enable = true;

        # System
        
        # Desktop
        # hyprland.enable = true;
        # hyprlock.enable = true;
                
        # Terminal Programs
        htop.enable = true;
        yazi.enable = true;
        nano.enable = true;
    };
}