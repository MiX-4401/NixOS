{ ... }:

{
    imports = [
        ./moduleBridge.nix
        ./Packages/moduleBundle.nix
        ./Bundles/moduleBundle.nix
        ./Other/moduleBundle.nix
    ];
}