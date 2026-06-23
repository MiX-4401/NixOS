{ lib, config, ... }:

{
    options = {
        SecurityHardenSSH.enable = lib.mkEnableOption "Harden OpenSSH";
    };

    config = lib.mkIf config.SecurityHardenSSH.enable {

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
    };
}