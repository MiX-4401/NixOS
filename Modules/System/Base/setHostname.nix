{ username, lib, config, ... }:

{
    options = {
        BaseSetHostname.hostname = lib.mkOption {
            type = lib.types.str;
            default = "${username}machine";
            description = "Set a device hostname";
        };
    };

    config = {
        networking.hostName = config.BaseSetHostname;
    };
}