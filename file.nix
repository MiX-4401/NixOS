# Knowledge base

# Functiton for creating new hosts within the flake.nix
{ ... }:

{
    # Function for creating new hosts
    # Take: hostname, system architecture, file imports
    # Return: New host build using lib.nixosSystem grabbed from nixpkgs
    # Notes: 
    # - Autodefines hostname using nix option 'networking.hostName'
    nixosConfigurations = let
        makeNewHost = { hostname, system, modules }: nixpkgs.lib.nixosSystem {
            inherit system;
            modules = modules ++ [{ networking.hostName = hostname }];
        };
    in 
    
    {
        ejdesktop = makeNewHost {
            hostname = "ejdesktop";
            system = "x86_64-linux";
            modules = [ ./Hosts/ejdesktop/configuration.nix ];
        };
    };
}

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

# 