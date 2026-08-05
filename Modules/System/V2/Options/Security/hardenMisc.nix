{ lib, config, ... }:

{
    options.core.system.security.hardenMisc = {

        # Firejail sandboxing
        sandboxing.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable firejail"; 
        };
    };

    # Hardening sudo settings
    config = {

        # Firejail sandboxing
        programs.firejail.enable = core.system.security.hardenMisc.sandboxing.enable;


    };
}