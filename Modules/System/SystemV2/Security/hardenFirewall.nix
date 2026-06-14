{ lib, config, ... }:

{
    options.securityHardenFirewall.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the hardening of the firewall";
    };

    options.securityHardenFirewall.allowedTCPPorts = lib.mkOption {
        type = lib.types.listOf lib.types.int;
        default = [ ];
        description = "Allow a list of allowed TPC ports";
    };

    options.securityHardenFirewall.allowedUDPPorts = lib.mkOption {
        type = lib.types.listOf lib.types.int;
        default = [ ];
        description = "Allow a list of allowed UDP ports";
    };

    # Hardening firewall settings
    config = {
        networking.firewall = {
            enable = config.securityHardenFirewall.enable;
            logRefusedPackets = true; # Log refused packets - accessible via: journalctl -u firewall

            # Allow specific incomming traffic
            allowedTCPPorts = config.securityHardenFirewall.allowedTCPPorts ++ (if config.services.openssh.enable then [ sshPort ] else [ ]);   # Add SSH port by defaultif SSH is enabled
            allowedUDPPorts = config.securityHardenFirewall.allowedUDPPorts ++ [ ];
        };
    };
}