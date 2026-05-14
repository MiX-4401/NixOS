{ username, inputs, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = { inherit inputs username; };
        users.${username} = {
            imports = [ ../../Modules/Desktop ];
            home.username = "${username}";
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";
        };
        environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
    };
}