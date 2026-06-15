{ lib, config, ... }:

{
    options.desktopGit.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable Git";
    };

    options.desktopGit.username = lib.mkOption {
        type = lib.types.str;
        default = "myusername";
        description = "Username to sign git";
    };

    options.desktopGit.email = lib.mkOption {
        type = lib.types.str;
        default = "myemail@gmail.com";
        description = "Email to sign git to";
    };

    config = {
        programs.git = { 
            enable = config.desktopGit.enable;
            userName = config.desktopGit.username;
            userEmail = config.desktopGit.email;
        };
    };
}