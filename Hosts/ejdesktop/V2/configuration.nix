{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/SystemV2/bootstrap.nix   # Import of the systems environment configurations
        ../../../Modules/Desktop/DesktopV2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./virtualisation.nix            # Import of custom virtualisation configurations
    ];

    # Modular settings imported from ../../System/SystemV2/bootstrap.nix which declares imports to modular settings
    baseSetOSVersion.version = "25.11";
    bootSystemdBoot.kernel = "zen";
    baseSetAllowUnfreeSoftware.enable = true;

    # Modular settings imported from ../../Desktop/DesktopV2/bootstrap.nix which declares imports to modular settings
    desktopDefaultApps.enable = true;
    desktopDefaultApps.defaultBrowser = "zen.desktop";
    desktopGit.enable = true;
    desktopGit.username = "MiX4401";
    desktopGit.email = "ej.radford@outlook.com.au";
    desktopHyprland.monitors = [ "HDMI-A-1,1920x1080@75,auto,1.2" "DP-2,1920x1080@144,0x0,1.2" ]; # Right, left monitors
    # dekstopHyprpaper.wallpaper = "/home/${username}/Pictures/Wallpapers/rainworld2.png";
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