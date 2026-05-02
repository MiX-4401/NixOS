{
  description = "System configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      nixlaptop = lib.nixosSystem {
        inherit system;
        modules = [
          ./Hosts/nixlaptop/configuration.nix
        ];
      };

      nixvm = lib.nixosSystem {
        system = { inherit system };
        specialArgs = { inherit inputs };

        modules = [
          ./Hosts/nixvm/configuration.nix
          ./Hosts/nixvm/home-manager.nix

          {
            home-manager.users.nixuser = import ./Hosts/nixvm/Dotfiles/home.nix;
          }    
        ];
      };
    };
  };
}
