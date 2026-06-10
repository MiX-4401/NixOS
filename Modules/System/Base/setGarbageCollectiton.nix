{ lib, config, ... }:

{
    options = {
        BaseSetGarbageCollection = lib.mkEnableOption "Enable garbage collection"
    };

    config = lib.mkIf config.BaseSetGarbageCollection.enable {

        # Garbage collection
        nix.gc = {
            automatic = true.;
            dates = "weekly";
            options = "--delete-older-than 14d";
        };
    };
}
