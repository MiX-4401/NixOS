{ lib, config, ... }:

{
    options.securityHardenSudo.enable = lib.mkOption {
        type = lib.types.str;
        default = true;
        description = "Enable the hardening of sudo"; 
    };

    # Hardening sudo settings
    config = lib.mkIf config.securityHardenSudo.enable {
        security.sudo = {
            execWheelOnly = true;   # Allow only users from the 'Wheel' group access to sudo
        };
    };
}