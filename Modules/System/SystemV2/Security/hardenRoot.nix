{ lib, config, ... }:

{
    options.securityHardenRoot.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the hardening of the root account";
    };

    # Hardening root settings
    config = lib.mkIf config.securityHardenRoot.enable {
        
        # Disable root account by providing an unvalid hash
        users.users.root.hashedPassword = "!";
    };
}