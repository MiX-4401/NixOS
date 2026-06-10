{ lib, config, ... }:

{
    options = {
        BaseSetOSVersion.version = lib.mkOption {
            type = lib.types.str;
            description = "Set the NixOS version";
        };
    };

    config = {
        system.stateVersion = config.BaseSetOSVersion.version;
    };
}