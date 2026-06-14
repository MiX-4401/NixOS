{ ... }:

{
    imports = [
        ./setHostname.nix
        ./setAllowUnfreeSoftware.nix
        ./setOSVersion.nix
        ./setGarbageCollection.nix
        ./setDownloadBufferSize.nix
    ];
}