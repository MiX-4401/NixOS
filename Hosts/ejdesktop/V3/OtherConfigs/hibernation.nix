{ config, ... }:

{
    ########################
    # Hibernation settings #
    ########################

    # Lock: 60 seconds
    # Sleep: 10 minutes
    # Hibernate: 10 minutes
    
    # Hypridle
    config.desktop.packages.hypridle.enable = true;
    config.desktop.packages.hypridle.lockAfter = 60; # Lock after 60 seconds
    config.desktop.packages.hypridle.sleepAfter = 600; # Sleep after 10 minutes
    
    # Sleep/hibernate
    config.core.mySystem.nixos.hibernation.enable = true;
    config.core.system.nixos.hibernation.hibernateDevice = "/dev/disk/by-uuid/3b56c352-90da-455f-964d-3d43564682c6";  # Do not need this one anymore
    config.core.system.nixos.hibernation.hibernateAfter = "10min"; # Hibernate after 10 minutes
}