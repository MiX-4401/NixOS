{ lib, config, ... }:

{
    options.core.system.security.hardenRoot = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable the hardening of the root account";
        };
    };

    # Hardening root settings
    config = lib.mkIf config.core.system.security.hardenRoot.enable {
        
        # Disable root account by providing an unvalid hash
        users.users.root.hashedPassword = "!";
    };
}