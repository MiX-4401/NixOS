{
  description = "System configurations";

  inputs = {

    # NixOS packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Stylix
    stylix.url = "github:nix-community/stylix/release-24.11";
    stylix.inputs.nixpkgs.follows = "nixpkgs";

    # Jolt
    jolt.url = "github:jordond/jolt";
    jolt.inputs.nixpkgs.follows = "nixpkgs";

    # Zen browser
    zen-browser.url = "github:youwen5/zen-browser-flake";
    zen-browser.inputs.nixpkgs.follows = "nixpkgs";
  };

  #outputs = { self, nixpkgs, home-manager, ... }@inputs:
  outputs = { self, nixpkgs, home-manager, stylix, ... }@inputs:
  let 
    lib = nixpkgs.lib;
    system = "x86_64-linux";
    username = "ejradford";
    wallpaper = "rainworld6.png";
  in {
    nixosConfigurations = {
      ejdesktop = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username wallpaper; };
        modules = [
          ./Hosts/ejdesktop/configuration.nix
        ];
      };
    };
  };
}
