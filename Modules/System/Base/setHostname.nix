{ username, lib, config, ... }:

{
    options = {
        BaseSetHostname = lib.mkOption {
            type = lib.types.str;
            default = "${username}machine";
            description = "Set a device hostname";
        };
    };

    config = {
        networking.hostname = config.BaseSetHostname;
    };
}