{ lib, config, ... }:

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
        }
    };


    config = lib.mkIf config.core.system.nixos.hibernation.enable {
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

        swapDevices = [{ device = config.core.system.nixos.hibernatDevice; }];
        boot.resumeDevice = config.core.system.nixos.hibernatDevice;
    };
}