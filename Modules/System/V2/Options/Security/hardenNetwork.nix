{ lib, config, ... }:

{
    options = {};

    config = {

        # Harden systemd NetworkManager service
        systemd.services.NetworkManager = {
            serviceConfig = {
                privateTmp = true;
                privateUsers = true;
                protectProc = "invisable";
                ProtectSystem = "strict";  
                PrivateTmp = "disconnected";
                ProtectHome = true;
                NoNewPrivileges= true;
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
        
            # connectionConfig = {
            #     ipv4.dhcp-send-hostname     = false; # Disable hostname advertising ipv4
            #     ipv4.dhcp-send-hostname-v2  = 0;
            #     ipv6.dhcp-send-hostname     = false; # Disable hostname advertising ipv6
            #     ipv6.dhcp-send-hostname-v2  = 0;
            # };
        };
    };
}