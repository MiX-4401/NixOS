{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/SystemV2/bootstrap.nix   # Import of the systems environment configurations
        ../../../Modules/Desktop/DesktopV2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./disko.nix                     # Import of declared paritioning schemes
        ./virtualisation.nix            # Import of custom virtualisation configurations
    ];

    # Modular settings imported from ../../System/SystemV2/bootstrap.nix which declares imports to modular settings
    baseSetOSVersion.version = "26.05";
    bootSystemdBoot.kernel = "zen";
    baseSetAllowUnfreeSoftware.enable = true;

    # Modular settings imported from ../../Desktop/DesktopV2/bootstrap.nix which declares imports to modular settings
    
    # Default applications
    desktopDefaultApps.enable = true;
    desktopDefaultApps.defaultBrowser = "zen.desktop";
    
    # Git
    desktopGit.enable = true;
    desktopGit.username = "MiX4401";
    desktopGit.email = "ej.radford@outlook.com.au";

    # Hyprland
    desktopHyprland.monitors = [ "HDMI-A-1,1920x1080@75,auto,1.2" "DP-2,1920x1080@144,0x0,1.2" ]; # Right, left monitors
    desktopHyprland.windowLayout = "master";
    desktopSetWallpaper.wallpaper = "rainworld8.jpg";
    
    # Desktop packages
    desktopPackageBundleDesktopUtilities.enable = true;
    desktopPackageBundleExtra.enable = true;
    desktopPackageBundleGaming.enable = true;
    desktopPackageBundleOfficeUtilities.enable = true;
    desktopPackageBundleSocials.enable = true;

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode-amd
        rocmPackages.rocm-smi
    ];

    programs.steam.enable = true;
    programs.gamescope.enable = true;
}