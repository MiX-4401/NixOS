{ lib, config, ... }:

{
    options.core.system.nixos.printing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable CUPs printing services";
        };

        
    };

    config = lib.mkIf config.core.system.nixos.printing.enable {
        services.printing.enable = true;
        services.printing.cups-pdf.enable = true;
    };
}