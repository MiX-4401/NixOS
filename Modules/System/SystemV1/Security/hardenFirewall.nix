{ lib, config, ... }:

{
    options = {
        SecurityHardenFirewall.enable = lib.mkEnableOption "Enable the firewall";
    };

    config = lib.mkIf config.SecurityHardenFirewall.enable {

        # Firewall settings
        networking.firewall = {
            enable = true;
            logRefusedPackets = true; # Log refused packets - accessible via: journalctl -u firewall

            # Allow specific incomming traffic
            # allowedTCPPorts = [ 
            #     6814      # SSH port 
            # ];

            # allowedUDPPorts = [ 

            # ];
        };
    };
}