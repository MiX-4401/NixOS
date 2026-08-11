{ lib, config, ... }:

{
    options.core.system.security.hardenNetwork = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable OpenSSH without hardening";
        };
    };

    config = lib.mkIf config.core.system.security.hardenNetwork.enable {

        # Disable unused network kernel modules
        boot.blacklistedKernelModules = [ 
            "dccp"   # Datagram Congestion Control Protocol
            "sctp"   # Stream Control Transmission Protocol
            "rds"    # Reliable Datagram Sockets
            "tipc"   # Transparent Inter-Process Communication
        ];


        # Harden systemd NetworkManager service
        systemd.services.NetworkManager = {
            serviceConfig = {
                NoNewPrivileges = true;
                PrivateTmp = true;
                ProtectSystem = "full";
                ProtectHome = true;
                RestrictSUIDSGID = true;
            };
        };

        # Harden NetworkManager
        networking.networkmanager = {
            
            # Disable dispatcherScripts
            dispatcherScripts = lib.mkForce [];

            
            # Randomise MAC address
            ethernet.macAddress = "random";
            wifi.macAddress = "random";

            # Logging
            logLevel = "TRACE";
        
            connectionConfig = {
                "ipv4.dhcp-send-hostname"     = false; # Disable hostname advertising ipv4
                "ipv4.dhcp-send-hostname-v2"  = 0;
                "ipv6.dhcp-send-hostname"     = false; # Disable hostname advertising ipv6
                "ipv6.dhcp-send-hostname-v2"  = 0;
            };
        };
    };
}