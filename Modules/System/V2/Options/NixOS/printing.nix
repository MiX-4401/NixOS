{ pkgs, lib, config, ... }:

{
    options.core.system.nixos.printing = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable CUPs printing services";
        };

        allowAutoDiscovery = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable printer auto-discovery via Avahi";
        };
        
        drivers = lib.mkOption {
            type = lib.types.listOf lib.types.package;
            default = [];
            description = "List of print drivers to include";
        };

        printers = lib.mkOption {
            type = lib.types.listOf lib.types.attrs;
            default = [];
            description = "List of print drivers to include";
        };
    };

    config = lib.mkIf config.core.system.nixos.printing.enable {
        
        # Printing
        services.printing = {
            enable = true;
            cups-pdf.enable = true;
            drivers = with pkgs; [cups-filters cups-browsed] ++ config.core.system.nixos.printing.drivers;
        };

        hardware.printers = {
            ensurePrinters = config.core.system.nixos.printing.printers;
        };

        # Autodiscovery services
        services.avahi = lib.mkIf config.core.system.nixos.printing.allowAutoDiscovery {
            enable = true;
            nssmdns4 = true;
            openFirewall = true;
        };
    };
}