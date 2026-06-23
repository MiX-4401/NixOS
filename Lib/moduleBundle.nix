{ inputs, ... }:

# Import custom functions to extend functionality of NixOS 

{
    mkHost = import ./mkHost.nix { inherit inputs; };
}