{ config, ... }:

{
    ########################
    # Hibernation settings #
    ########################

    # Lock: 2 minutes
    # Sleep: 10 minutes
    # Hibernate: 10 minutes (total 22 minutes)
    
    # Hypridle
    config.desktop.packages.hypridle.enable = true;
    config.desktop.packages.hypridle.lockAfter = 120; # Lock after 2 minutes
    
    # Sleep
    config.desktop.packages.hypridle.sleepAfter = 600; # Sleep after 10 minutes
    
    # Hibernate
    config.core.system.nixos.hibernation.enable = true;
    config.core.system.nixos.hibernation.hibernateDevice = "/dev/disk/by-uuid/81e9d1db-bebb-46d7-a324-b2d05717ab6b";
    config.core.system.nixos.hibernation.hibernateAfter = "10min"; # Hibernate after 10 minutes
}