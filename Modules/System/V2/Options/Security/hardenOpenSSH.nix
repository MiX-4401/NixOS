{ lib, config, ... }:

{

    options.core.system.security.hardenOpenSSH = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable OpenSSH without hardening";
        };
        
        harden = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable the hardening of OpenSSH";
        };
        
        ports = lib.mkOption {
            type = lib.types.listOf lib.types.int;
            default = [ 6814 ];
            description = "Int of the TCP port for OpenSSH";
        };
    };

    # Hardening openssh settings
    config = {

        # SSH settings
        services.openssh = {
            enable = config.core.system.security.hardenOpenSSH.enable;
            ports = config.core.system.security.hardenOpenSSH.ports;

            
            settings = lib.mkIf (config.core.system.security.hardenOpenSSH.harden) {
                PasswordAuthentication = false;
                PermitRootLogin = "no";
            }; 
            extraConfig = lib.mkIf (config.core.system.security.hardenOpenSSH.harden) ''
                AllowTcpForwarding yes
                X11Forwarding no
                AllowAgentForwarding no
                AllowStreamLocalForwarding no
                AuthenticationMethods publickey
            '';
        };
    };
}