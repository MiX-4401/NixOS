{ lib, config, ... }:

{
    options.core.system.security.hardenSudo = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable the hardening of sudo"; 
        };
    };

    # Hardening sudo settings
    config = lib.mkIf config.core.system.security.hardenSudo.enable {
        security.sudo = {
            execWheelOnly = true;   # Allow only users from the 'Wheel' group access to sudo
        };
    };
}