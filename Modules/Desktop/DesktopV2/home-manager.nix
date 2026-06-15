{ inputs, username, ... }: 

{
    # Import HomeManager libraries
    imports = [
        inputs.home-manager.nixosModules.home-manager
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPacakges = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
    home-manager.users.${username} = {

        # Import desktop modules impacting the desktop environment
        imports = [
            ./DefaultApplications
            ./Git
            ./Hyprland
            ./Hyprlock
            ./Kitty
            ./Rofi
            ./Shell
            ./SwayNotificationCentre
            ./Walker
            ./Wallpapers
            ./Waybar
            ./Waypaper
        ];
    };

    # Install applications relating to the destop environment
    home.packages = [
        
        # Destop environment
        pkgs.waybar
        pkgs.clipse
        pkgs.hyprshot
        pkgs.pavucontrol
        pkgs.waypaper
        pkgs.walker
        pkgs.wl-clipboard
        pkgs.font-awesome_5
        pkgs.breeze-hacked-cursor-theme
        pkgs.libnotify
        pkgs.swaynotificationcenter
        pkgs.rofi

        # User GUI applications
        pkgs.firefox
        pkgs.vscode
        pkgs.gnome-calculator
        pkgs.gnome-clocks
        pkgs.nautilus
        pkgs.gnome-weather
        pkgs.gnome-disk-utility
        pkgs.gnome-calendar
        pkgs.bitwarden-desktop                
        pkgs.discord
        pkgs.spotify
        pkgs.lutris
        pkgs.prismlauncher
        pkgs.gimp
        pkgs-updated.rustdesk
        
        # User TUI applications
        pkgs.yazi
        pkgs.btop

        # User CLI applications
        pkgs.neofetch
        pkgs.cbonsai
        pkgs.cmatrix
        pkgs.cava
        pkgs.python3
        
        # External flake packages
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}