{
  description = "System configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
    home-manager.url = "github:nix-community/home-manager/release-24.05";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = { self, nixpkgs, home-manager, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations = {
      ejlaptop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

        modules = [
          ./Hosts/ejlaptop/configuration.nix
          ./Hosts/ejlaptop/home-manager.nix

          {
            home-manager.users.ejradford = import ./Hosts/ejlaptop/Dotfiles/home.nix;
          }
        ];
      };

      nixvm = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };

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
