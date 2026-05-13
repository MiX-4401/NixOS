{
  description = "System configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    username = "ejradford";
  in {
    nixosConfigurations = {
      ejlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username; };

        modules = [
          ./Hosts/ejlaptop/configuration.nix
        ];
      };
    };
  };
}