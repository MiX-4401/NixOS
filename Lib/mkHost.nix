{ inputs, ... }:
{ hostname, username, system, modules ? [], specialArgs ? {}, ... }:

# Function for creating new hosts
# Take: hostname, system architecture, file imports
# Return: New host build using lib.nixosSystem grabbed from nixpkgs
# Notes: 
# - Simplfies specialArgs boilerplate
# - Autodefines hostname using nix option 'networking.hostName'

inputs.nixpkgs.lib.nixosSystem {
    inherit system;
     
    specialArgs = specialArgs // {  # SpecialArgs: Joins some specialArgs boilerplate with custom arguments to simplfy specialArgs
        inherit inputs username; 

        # Passthrough unstable nixpkgs input to allow explicit installation of packages from the unstable nixpkgs source
        pkgsUnstable = import inputs.nixpkgs-unstable {
            inherit system;
            config.allowUnfree = true;
        };
    }; 
    modules = modules ++ [{ networking.hostName = inputs.nixpkgs-stable.lib.mkDefault hostname; }];    # modules: Joins auto setting hostname with custom mdoules to simplfy networking modules
}