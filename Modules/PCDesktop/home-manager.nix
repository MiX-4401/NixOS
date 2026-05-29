{ username, inputs, pkgs, pkgs-updated, wallpaper, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username wallpaper; };
        users.${username} = {
            imports = [ 
                ./Hyprland  # Compositor
                ./Hyprpaper # Wallpaper engine
                ./Waypaper  # Wallapaper engine
                ./Shell     # Shell zsh
                ./Kitty     # Terminal
                ./Waybar    # StatusBar
                ./Rofi      # App launcher
                # ./Walker    # App launcher
                #./Dunst     # Notification daemon
                ./Cursor    # Cursor
                ./SwayNotificationCentre
                ./Git
                ./DefaultApplications
            ];

            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";

            home.packages = [
                
                # Destop environment
                pkgs.hyprpaper
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
                pkgs.virt-manager
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
                inputs.jolt.packages.${pkgs.stdenv.hostPlatform.system}.default
                inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
            ];
        };
    };
}
