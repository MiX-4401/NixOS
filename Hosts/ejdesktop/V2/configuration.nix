{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix   # Import of the systems environment configurations
        ../../../Modules/Desktop/V2/bootstrap.nix # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems 
        ./virtualisation.nix            # Import of custom virtualisation configurations
    ];

    # Core system modular settings
    
    # Security options
    core.system.security.hardenSudo.enable = true;
    core.system.security.hardenOpenSSH.enable = true;
    core.system.security.hardenOpenSSH.harden = true;
    core.system.security.hardenRoot.enable = true;
    core.system.security.hardenFirewall.enable = true;
    core.system.nix.allowUnfreeSoftware = true;
    core.system.nixos.hostname = "ejdesktop";
    core.system.nixos.garbageCollection.enable = true;
    core.system.nixos.garbageCollection.period = "daily";
    core.system.nixos.osVersion = "26.05";
    core.system.misc.gaming.enable = true;
    core.system.nixos.hibernation.enable = true;
    core.system.nixos.hibernation.hibernateDevice = "/dev/sdc3";
    core.system.nixos.hibernation.hibernateAfter = "10m";
    core.system.nixos.hibernation.sleepAfter = "5m";

    # Core desktop modular settings

    # Default applications
    desktopDefaultApps.enable = true;
    desktopDefaultApps.defaultBrowser = "zen.desktop";
    
    # Git
    desktopGit.enable = true;
    desktopGit.username = "MiX4401";
    desktopGit.email = "ej.radford@outlook.com.au";

    # Hyprland
    desktopHyprland.monitors = [ "HDMI-A-1,1920x1080@75,auto,1.2" "DP-1,1920x1080@144,0x0,1.2" ]; # Right, left monitors
    desktopHyprland.windowLayout = "dwindle";
    desktopSetWallpaper.wallpaper = "scorn02.jpg";
    
    # Desktop package bundles
    desktopPackageBundleDesktopUtilities.enable = true;
    desktopPackageBundleExtra.enable = true;
    desktopPackageBundleGaming.enable = true;
    desktopPackageBundleOfficeUtilities.enable = true;
    desktopPackageBundleSocials.enable = true;

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode-amd
        rocmPackages.rocm-smi
        mdadm
        radeontop
    ];

    boot.kernelPackages = pkgs.linuxPackages_zen;
}
