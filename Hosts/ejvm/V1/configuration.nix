{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix    # Import of the systems environment configurations
        ../../../Modules/Desktop/V3/bootstrap.nix   # Import of the desktop environment configurations
        
        # Host specific imports
        ./hardware-configuration.nix    # Import of the physical storage systems
        ./disko-config.nix
    ];

    # Core system modular settings
    
    # Security options
    core.system.security.hardenSudo.enable = false;
    core.system.security.hardenOpenSSH.enable = true;
    core.system.security.hardenOpenSSH.harden = false;
    core.system.security.hardenRoot.enable = false;
    core.system.security.hardenFirewall.enable = false;
    core.system.nix.allowUnfreeSoftware = true;
    core.system.nixos.hostname = "ejvm";
    core.system.nixos.osVersion = "26.05";
    
    # Sleep & hibernation
    core.system.nixos.hibernation.enable = false;
    desktop.packages.hypridle.enable = false;

    # Misc
    core.system.misc.wallpaper.filename = "rainworld12.png";

    # Core desktop modular settings
    
    # Git
    desktop.packages.git.enable = true;
    desktop.packages.git.username = "MiX4401";
    desktop.packages.git.email = "ej.radford@outlook.com.au";

    # Hyprland
    desktop.packages.hyprland.monitors = [ 
        { output = "HDMI-A-1"; mode = "1920x1080@75"; position = "auto"; scale = 1.2; } 
        { output = "DP-1"; mode = "1920x1080@144"; position = "0x0"; scale = 1.2; }
    ];
    desktop.packages.hyprland.layout = "dwindle";
    desktop.packages.hyprland.sensitivity = -1.0;
    desktop.packages.hyprland.scrollFactor = 1.0;
    

    # Host specific software
    # environment.systemPackages = with pkgs; [
    # ];
}
