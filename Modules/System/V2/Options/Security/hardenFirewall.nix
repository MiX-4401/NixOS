{ lib, config, ... }:

{
    options.core.system.security.hardenFirewall = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable the hardening of the firewall";
        };
        
        allowedTCPPorts = lib.mkOption {
            type = lib.types.listOf lib.types.int;
            default = [ ];
            description = "Allow a list of allowed TPC ports";
        };
        
        allowedUDPPorts = lib.mkOption {
            type = lib.types.listOf lib.types.int;
            default = [ ];
            description = "Allow a list of allowed UDP ports";
        };
    };

    # Hardening firewall settings
    config = {
        networking.firewall = {
            enable = config.core.system.security.hardenFirewall.enable;
            logRefusedPackets = true; # Log refused packets - accessible via: journalctl -u firewall

            # Allow specific incomming traffic
            allowedTCPPorts = config.core.system.security.hardenFirewall.allowedTCPPorts ++ (if config.services.openssh.enable then config.services.openssh.ports else [ ]);   # Add SSH port by defaultif SSH is enabled
            allowedUDPPorts = config.core.system.security.hardenFirewall.allowedUDPPorts ++ [ ];
        };
    };
}