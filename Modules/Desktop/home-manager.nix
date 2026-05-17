{ username, inputs, pkgs, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username; };
        users.${username} = {
            imports = [ 
                ./Hyprland
                ./Hyprpaper
                ./Shell
                ./Kitty
            ];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";

            home.packages = [
                pkgs.firefox
                pkgs.hyprpaper
                pkgs.neofetch
                pkgs.gnome-calculator
            ];
        };
    };
}