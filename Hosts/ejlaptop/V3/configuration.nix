{ lib, username, pkgs, config, ... }:

{
    imports = [
        
        # Bootstrap imports
        ../../../Modules/System/V2/bootstrap.nix    # Import of the systems environment configurations
        ../../../Modules/Desktop/V3/bootstrap.nix   # Import of the desktop environment configurations
        ./CoreConfigs/system.nix
        ./CoreConfigs/desktop.nix
        
        # Host specific imports
        ./hardware-configuration.nix                # Import of hardware configurations and mount points 
        ./OtherConfigs/disko-config.nix             # Import of disko disk partitioning
        ./OtherConfigs/powermanagement.nix          # Import of suspend and hibernation power modules
        ./OtherConfigs/yubikey.nix
    ];

    # Host specific software
    environment.systemPackages = with pkgs; [
        microcode-intel
    ];
    
    boot.kernelPackages = pkgs.linuxPackages_zen;
}
