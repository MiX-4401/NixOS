{ ... };

{
    ## User access hardening 
    
    # Disable root account
    users.users.root.hashedPassword = "!";

    # Sudo settings
    security.sudo = {
        execWheelOnly = true;
    };

    # SSH settings
    services.openssh = {
        enable = false;
        ports = 6814;
        settings = {
            PasswordAuthentication = false;
            PermitRootLogin = "no";
        };
        extraConfig = ''
            AllowTcpForwarding yes
            X11Forwarding no
            AllowAgentForwarding no
            AllowStreamLocalForwarding no
            AuthenticationMethods publickey
        '';
    };

    ## Network hardening

    # Firewall settings
    networking.firewall = {
        enable = true;
        logRefusedPackets = true # Log refused packets - accessible via: journalctl -u firewall

        # Allow specific incomming traffic
        # allowedTCPPorts = [ 
        #     6814      # SSH port 
        # ];

        # allowedUDPPorts = [ 

        # ];
    };


}