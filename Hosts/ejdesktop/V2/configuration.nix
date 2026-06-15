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

    # Modular settings imported from ../../Desktop/DesktopV2/bootstrap.nix which declares imports to modular settings
    desktopDefaultApps.enable = false;
    desktopHyprland.monitors = [
        # Left monitor
        "HDMI-A-1,1920x1080@75,auto,1.2"

        # Right monitor
        "DP-2,1920x1080@144,0x0,1.2"
    ];

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode.amd
        rocmPackages.rocm-smi
    ];

    programs = {
        steam.enable = true;
        gamescope.enable = true;
    };
}