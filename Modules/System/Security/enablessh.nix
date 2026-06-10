{ lib, config, ... }:

{
    options = {
        enableopenssh.enable = lib.mkEnableOption "Harden OpenSSH";
    };

    config = lib.mkIf config.enableopenssh.enable {

        # SSH settings
        services.openssh = {
            enable = true;
            ports = [ 2910 ];
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