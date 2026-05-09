{ username, ... }:

{
    imports = [ inputs.home-manager.nixosModules.home-manager ];
    home-manager = {
        home-manager.useGlobalPkgs = true;
        home-manager.useUserPackages = true;
        home-manager.extraSpecialArgs = { inherit inputs username; };
        users.${username} = {
            imports = [ ../Modules/Desktop ];
            home.username = ${username};
            home.homeDirectory = "/home/${username}";
            home.stateVersion = "24.05";
            programs.home-manager.enable = true;
        }
    };
}