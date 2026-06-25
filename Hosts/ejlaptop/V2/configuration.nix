{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix   # Import of the systems environment configurations
        ../../../Modules/Desktop/V2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
    ];

    # Modular settings imported from ../../System/V2/bootstrap.nix which declares imports to modular settings
    baseSetOSVersion.version = "26.05";
    bootSystemdBoot.kernel = "zen";
    baseSetAllowUnfreeSoftware.enable = true;
    securityHarndenRoot = false;

    # Modular settings imported from ../../Desktop/V2/bootstrap.nix which declares imports to modular settings
    
    # Default applications
    desktopDefaultApps.enable = true;
    desktopDefaultApps.defaultBrowser = "zen.desktop";
    
    # Git
    desktopGit.enable = true;
    desktopGit.username = "MiX4401";
    desktopGit.email = "ej.radford@outlook.com.au";

    # Hyprland
    desktopHyprland.monitors = [ ",preferred,auto,1.2" ];
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
        microcode-intel
    ];
}
