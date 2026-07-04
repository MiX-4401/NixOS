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
            default = "1h";
            description = "How long after sleeping should the system hibernate (1h)";
        }
    };


    config = lib.mkIf config.core.system.nixos.hibernation.enable {
        
        # Pulled from https://wiki.nixos.org/wiki/Power_Management#Hibernation (I do not know how it works)
        services.udev.extraRules = 
        let
            mkRule = as: lib.concatStringsSep ", " as;
            mkRules = rs: lib.concatStringsSep "\n" rs;
        in mkRules ([( mkRule [
            ''ACTION=="add|change"''
            ''SUBSYSTEM=="block"''
            ''KERNEL=="sd[a-z]"''
            ''ATTR{queue/rotational}=="1"''
            ''RUN+="${pkgs.hdparm}/bin/hdparm -B 90 -S 41 /dev/%k"''
        ])]);

        # Hibernate device to resume from 
        swapDevices = [{ device = config.core.system.nixos.hibernatDevice; }]; 
        boot.resumeDevice = config.core.system.nixos.hibernatDevice;

        # Allow sleep
        systemd.sleep.settings.Sleep = {
            AllowSuspend = "yes";
            AllowHibernation = "yes";
            HibernateDelaySec = "10min";
            AllowHybridSleep = "yes";
            AllowSuspendThenHibernate = "yes";
        };

        services.logind.extraConfig = ''
            IdleAction=suspend
            IdleActionSec=5min
        '';
    };
}