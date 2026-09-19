{ lib, config, ... }:

{
    options.core.system.nixos.printing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable CUPs printing services";
        };
        
        drivers = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "List of print drivers to include";
        };
    };

    config = lib.mkIf config.core.system.nixos.printing.enable {
        services.printing.enable = true;
        services.printing.cups-pdf.enable = true;
        services.printing.drivers = config.core.systems.nixos.printing.drivers;
    };
}