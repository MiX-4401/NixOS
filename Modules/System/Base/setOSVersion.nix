{ lib, config, ... }:

{
    options = {
        BaseSetOSVersion = lib.mkOption {
            type = lib.types.str;
            description = "Set the NixOS version";
        };
    };

    config = {
        system.stateVersion = config.BaseSetOSVersion;
    };
}