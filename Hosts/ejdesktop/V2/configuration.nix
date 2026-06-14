{ pkgs, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../Modules/System/SystemV2/bootstrap.nix   # Import of the systems environment configurations
        ../../Modules/Desktop/DesktopV2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./virtualisation.nix            # Import of custom virtualisation configurations
    ];

    # Modular settings imported from ../../System/SystemV2/bootstrap.nix which declares imports to modular settings
    baseSetOSVersion.version = "25.11";
    bootSystemdBoot.kernel = "zen";

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode.amd
        rocmPackages.rocm-smi
    ];

    programs = {
        # steam.enable = true;
        # gamescope.enable = true;
    };
}