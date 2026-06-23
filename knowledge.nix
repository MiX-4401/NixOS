# Knowledge base

# Functiton for creating new hosts within the flake.nix
# { ... }:

# {
#     # Function for creating new hosts
#     # Take: hostname, system architecture, file imports
#     # Return: New host build using lib.nixosSystem grabbed from nixpkgs
#     # Notes: 
#     # - Autodefines hostname using nix option 'networking.hostName'
#     nixosConfigurations = let
#         makeNewHost = { hostname, system, modules }: nixpkgs.lib.nixosSystem {
#             inherit system;
#             modules = modules ++ [{ networking.hostName = hostname }];
#         };
#     in 
    
#     {
#         ejdesktop = makeNewHost {
#             hostname = "ejdesktop";
#             system = "x86_64-linux";
#             modules = [ ./Hosts/ejdesktop/configuration.nix ];
#         };
#     };
# }

# Merging sets which are defined multiple times
# { pkgs, lib, ... }:

# {
#     environment.systemPackages = lib.mkBefore [
#         # These packages come first
#         # ...
#     ];  

#     environment.systemPackges = [
#         # These packages come after
#         # ...
#     ]

#     # All packages are concrecated/merged at the end
# }

# Installing software conditionally

# configuration.nix
# { config, pkgs, ... }:    # Config parameter means to reviewer sets from other modules

# {
#     environemnt.systemPackages = if config.programs.hyprland.enable then [
#         pkgs.waybar
#     ];
# }

# # file1.nix
# { config, ... }:

# {
#     programs.hyprland.enable = true;
# }

# Aliasing options for easier imports
# First list defines the new namespace
# Second list defines the path to the options being aliased

# imports = [
#   (lib.mkAliasOptionModule
#     [ ns "home-manager" ]     # Turns into ${ns}.home-manager"
#     [ "home-manager" "users" username ns ] # Turns into "home-manger.users.${username}.${ns}"
#   )
# ];

# Version pinning inputs

# inputs.hyprland = {
#     type = "git";
#     url = "https://github.com/hyprwm/Hyprland";
#     rev = "882f7ad7d2bbfc7440d0ccaef93b1cdd78e8e3ff"; # Full sha256 of commit, choose a tagged version for plugin compatibility
#     submodules = true;
#     inputs.nixpkgs.follows = "nixpkgs";
# };
