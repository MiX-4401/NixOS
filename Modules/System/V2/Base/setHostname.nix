{ username, lib, config, ... }:

{
    options.baseSetHostname.hostname = lib.mkOption {
        type = lib.types.str;
        default = username;
        description = "Set a device hostname";
    };

    config = {
        networking.hostName = config.baseSetHostname.hostname;
    };
}