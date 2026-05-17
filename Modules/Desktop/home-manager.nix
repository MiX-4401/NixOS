{ username, inputs, pkgs, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username; };
        users.${username} = {
            imports = [ 
                ./Hyprland  # Compositor
                ./Hyprpaper # Wallpaper
                ./Shell     # Shell zsh
                ./Kitty     # Terminal
                # ./Ashell    # StatusBar
                ./Walker    # App launcher
                # ./Rofi
            ];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";

            home.packages = [
                pkgs.firefox
                pkgs.hyprpaper
                pkgs.neofetch
                # pkgs.ashell
                pkgs.walker
                # pkgs.waypaper
                # pkgs.hyprlauncher
                # pkgs.rofi
            ];
        };
    };
}