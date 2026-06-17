{ lib, config, ... }:

{
    options.securityHardenSSH.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the hardening of OpenSSH";
    };

    options.securityHardenSSH.port = lib.mkOption {
        type = lib.types.listOf lib.types.int;
        default = [ 6814 ];
        description = "Int of the TCP port for OpenSSH";
    };

    # Hardening openssh settings
    config = {

        # SSH settings
        services.openssh = {
            enable = config.securityHardenSSH.enable;
            ports = config.securityHardenSSH.port;
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
    };
}