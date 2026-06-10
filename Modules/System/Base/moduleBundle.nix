{ ... }:

{
    imports = [
        ./setHostname.nix
        ./setAllowUnfreeSoftware.nix
        ./setOSVersion.nix
        ./setGarbageCollectiton.nix
    ];
}