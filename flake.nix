{
  description = "System configurations";

  inputs = {

    # NixOS packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:nix-community/stylix/release/25.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
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