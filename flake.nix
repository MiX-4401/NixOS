{
  description = "System configurations";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.05";
  };

  outputs = { self, nixpkgs, ... }@inputs:
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
        inherit system;
        modules = [
          ./Hosts/nixvm/configuration.nix
        ];
      };
    };
  };
}
