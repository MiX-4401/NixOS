{
  description = "System configurations";

  inputs = {

    # NixOS packages
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-updated.url = "github:NixOS/nixpkgs/nixos-26.05";

    # Home Manager
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # Hyprland 
    hyprland.url = "github:hyprwm/Hyprland/0002f148c9a4fe421a9d33c0faa5528cdc411e62";
    hyprland.inputs.nixpkgs.follows = "nixpkgs";

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

  outputs = { self, nixpkgs, nixpkgs-updated, home-manager, stylix, ... }@inputs:
  let 
    system = "x86_64-linux";
    username = "ejradford";
    wallpaper = "rainworld6.png";
    pkgs-updated = import nixpkgs-updated { 
      inherit system; 
      config.allowUnfree = true;
    };
  in {
    nixosConfigurations = {
      ejdesktop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username wallpaper pkgs-updated; };
        modules = [
          ./Hosts/ejdesktop/configuration.nix
        ];
      };
      ejlaptop = nixpkgs.lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs username wallpaper; };
        modules = [
          ./Hosts/ejlaptop/configuration.nix
        ];
      };
    };
  };
}
