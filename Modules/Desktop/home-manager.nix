{ username, inputs, pkgs, wallpaper ... }:

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
                ./Ashell    # StatusBar
                ./Walker    # App launcher
            ];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";

            home.packages = [
                pkgs.firefox
                pkgs.hyprpaper
                pkgs.neofetch
                pkgs.ashell
                pkgs.walker
                pkgs.waypaper
            ];
        };
    };
}