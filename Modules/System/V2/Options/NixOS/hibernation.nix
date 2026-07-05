{ pkgs, lib, config, ... }:

{

    options.core.system.nixos.hibernation = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable system hibernation";
        };
        
        hibernateDevice = lib.mkOption {
            type = lib.types.str;
            description = "The device (swap) which will handle hibernation"; 
        };

        hibernateAfter = lib.mkOption {
            type = lib.types.str;
            default = "30min";
            description = "How long after sleeping should the system hibernate (1h)";
        };
        
        sleepAfter = lib.mkOption {
            type = lib.types.str;
            default = "30min";
            description = "How long after idling should the system sleep (30min)";
        }; 
    };


    config = lib.mkIf config.core.system.nixos.hibernation.enable {
        
        # Enable hibernation and suspend options
        powerManagement.enable = true;

        # # Pulled from https://wiki.nixos.org/wiki/Power_Management#Hibernation (I do not know how it works)
        # services.udev.extraRules = 
        # let
        #     mkRule = as: lib.concatStringsSep ", " as;
        #     mkRules = rs: lib.concatStringsSep "\n" rs;
        # in mkRules ([( mkRule [
        #     ''ACTION=="add|change"''
        #     ''SUBSYSTEM=="block"''
        #     ''KERNEL=="sd[a-z]"''
        #     ''ATTR{queue/rotational}=="1"''
        #     ''RUN+="${pkgs.hdparm}/bin/hdparm -B 90 -S 41 /dev/%k"''
        # ])]);

        # Hibernate device to resume from 
        swapDevices = [{ device = config.core.system.nixos.hibernation.hibernateDevice; }]; 
        boot.resumeDevice = config.core.system.nixos.hibernation.hibernateDevice;

        # Allow sleep
        systemd.sleep.settings.Sleep = {
            AllowSuspend = true;
            AllowHibernation = true;
            AllowSuspendThenHibernate = true;
            SuspendState = "mem";
            HibernateDelaySec = config.core.system.nixos.hibernation.hibernateAfter;
        };

        services.logind.settings.Login = {
            IdleAction = "suspend-then-hibernate";
            IdleActionSec = config.core.system.nixos.hibernation.sleepAfter;
        };
    };
}