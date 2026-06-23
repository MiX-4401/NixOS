{ lib, config, ... }:

{
    options.baseSetGarbageCollection.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable garbage collection";
    };

    config = {

        # Garbage collection
        nix.gc = {
            automatic = config.baseSetGarbageCollection.enable;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };
}
