{ lib, config, ... }:

{
    options = {
        desktop.packages.git.enable = lib.mkOption {
            type = lib.types.bool;
            default = true;
            description = "Enable Git";
        };

        desktop.packages.git.username = lib.mkOption {
            type = lib.types.str;
            default = "myusername";
            description = "Username to sign git";
        };

        desktop.packages.git.email = lib.mkOption {
            type = lib.types.str;
            default = "myemail@gmail.com";
            description = "Email to sign git to";
        };
    };

    config = {
        programs.git = {
            enable = config.desktop.packages.git.enable;
            settings = {
                user.name = config.desktop.packages.git.username;
                user.email = config.desktop.packages.git.email;
            };
        };
    };
}