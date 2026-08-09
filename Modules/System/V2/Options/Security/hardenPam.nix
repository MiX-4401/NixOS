{ lib, config, ... }:

{

    options = {
        core.system.security.hardenPam = {
            enable = lib.mkOption {
                type = lib.types.bool;
                default = true;
                description = "Enable PAM hardening";
            }; 
        };
    };
    
    config = {
        
        security.pam = {

            # Lockdown sshd even further lol
            services.sshd = {
                failDelay.enable = true;
                failDely.delay = 4000000;
            }; 

            # Increase hashing rounds
            services.passwd.rules.password."unix".settings.rounds = 500000;

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