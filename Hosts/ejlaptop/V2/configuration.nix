{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix   # Import of the systems environment configurations
        ../../../Modules/Desktop/V2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./powermanagement.nix           # Import of suspend and hibernation power modules
    ];

    # Core system modular settings
    
    # Security options
    core.system.security.hardenSudo.enable = true;
    core.system.security.hardenOpenSSH.enable = true;
    core.system.security.hardenOpenSSH.harden = true;
    core.system.security.hardenRoot.enable = true;
    core.system.security.hardenFirewall.enable = true;
    core.system.nix.allowUnfreeSoftware = true;
    core.system.nixos.hostname = "ejlaptop";
    core.system.nixos.garbageCollection.enable = true;
    core.system.nixos.garbageCollection.period = "daily";
    core.system.nixos.osVersion = "26.05";
    core.system.misc.gaming.enable = false;

    # Core desktop modular settings

    # Default applications
    desktopDefaultApps.enable = true;
    desktopDefaultApps.defaultBrowser = "zen.desktop";
    
    # Git
    desktopGit.enable = true;
    desktopGit.username = "MiX4401";
    desktopGit.email = "ej.radford@outlook.com.au";

    # Hyprland
    # desktopHyprland.monitors = [ ",preferred,auto,1.2" ]; 
    # desktopHyprland.windowLayout = "dwindle";
    desktopSetWallpaper.wallpaper = "rainworld01.jpg";
    
    # Desktop package bundles
    desktopPackageBundleDesktopUtilities.enable = true;
    desktopPackageBundleExtra.enable = true;
    desktopPackageBundleGaming.enable = false;
    desktopPackageBundleOfficeUtilities.enable = true;
    desktopPackageBundleSocials.enable = false;


    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode-intel
    ];
    
    # boot.kernelPackages = pkgs.linuxPackages_zen.kernel
}
