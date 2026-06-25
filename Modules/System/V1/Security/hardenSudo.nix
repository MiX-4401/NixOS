{ lib, config, ... }:

{
    options = {
        SecurityHardenSudo.enable = lib.mkEnableOption "Harden sudo";
    };

    config = lib.mkIf config.SecurityHardenSudo.enable {
        
        # Sudo settings
        security.sudo = {
            execWheelOnly = true;
        };
    };
}