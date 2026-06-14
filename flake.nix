{
    description = "Multi-Host Modular System Configurations";
    
    # 
    inputs = {

        # NixOS nixpkgs contains: Software packages, helper libraries
        nixpkgs.url = "github:NixOS/nixpkgs/nixos-26.05";
        nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";
    
        # Home manager contains: Software package, helper libraries
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";

        # Stylix contains: Software package, helper libraries
        stylix.url = "github:nix-community/stylix/release-24.11";
        stylix.inputs.nixpkgs.follows = "nixpkgs";

        # Additional software
        zen-browser.url = "github:youwen5/zen-browser-flake";
        zen-browser.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: 
    let
        # Import my custom lib functions
        myLib = import ./Lib/moduleBundle.nix { inherit inputs; };
    in { 
        # Hosts
        
        # My general use, gaming desktop
        nixosConfigurations.ejdesktop = myLib.mkHost {    # Uses my custom mkHost function to take care of boilerplate
            hostname = "ejdesktop";
            username = "ejradford";
            system = "x86_64-linux";
            modules = [ ./Hosts/ejdesktop/configuration.nix ];
            specialArgs = { };
        };

        # My general use, office laptop

        # ...
        
        # My server

        # ...
    };
}