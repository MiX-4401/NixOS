{ lib, config, ... }:

{
    options = {
        SecurityHardenRoot.enable = lib.mkEnableOption "Harden the root account";
    };

    config = lib.mkIf config.SecurityHardenRoot.enable {
        
        # Disable root account
        users.users.root.hashedPassword = "!";
    };
}