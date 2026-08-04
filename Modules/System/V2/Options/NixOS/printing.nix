{ lib, config, ... }:

{
    options.core.system.nixos.printing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable CUPs printing services";
        };

        
    };

    config = config.core.system.nixos.printing.enable {
        services.printing.enable = true;
        serivces.printing.cups-pdf.enable = true;
    };
}