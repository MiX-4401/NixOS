{ inputs, self, ... }:

# Function for creating new hosts
# Take: hostname, system architecture, file imports
# Return: New host build using lib.nixosSystem grabbed from nixpkgs
# Notes: 
# - Autodefines hostname using nix option 'networking.hostName'

{
    hostname,
    system,
    modules
}:

inputs.nixpkgs.lib.nixosSystem {
    inherit system;

    specialArgs = {

    };

    modules = modules ++ [{ networking.hostName = ${hostname} }];
}