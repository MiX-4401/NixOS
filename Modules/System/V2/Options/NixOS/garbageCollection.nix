{ lib, config, ... }:

{
    options.core.system.nixos.garbageCollection = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable garbage collection";
        };

        period = lib.mkOption {
            type = lib.types.str;
            default = "weekly";
            description = "Period for garbage colection. Default is weekly";
        };
    };

    config = {

        # Garbage collection
        nix.gc = {
            automatic = config.core.system.nixos.garbageCollection.enable;
            dates = config.core.system.nixos.garbageCollection.period;
            options = "--delete-older-than 14d";
        };
    };
}
