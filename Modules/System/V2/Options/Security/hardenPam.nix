{ lib, config, ... }:

{

    options.core.system.security.hardenPam = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable PAM hardening";
        }; 
    };
    
    config = {
        
        # Increase hashing rounds
        security.loginDefs.settings = {
            ENCRYPT_METHOD = "YESCRYPT";
            YESCRYPT_COST_FACTOR = "7"; # Options range from 5 to 11
        };

        security.pam = {

            # Lockdown sshd even further lol
            services.sshd = {
                failDelay.enable = true;
                failDelay.delay = 4000000;
            }; 


            # Log logins
            services.sshd.logFailures = true;
            services.sudo.logFailures = true;
            services.login.logFailures = true;
            services.su.logFailures = true;
            services.password.logFailures = true;
            services.sshd.lastlog.enable = true;
            services.sudo.lastlog.enable = true;
            services.login.lastlog.enable = true;
            services.su.lastlog.enable = true;
            services.password.lastlog.enable = true;
        };
    };
}