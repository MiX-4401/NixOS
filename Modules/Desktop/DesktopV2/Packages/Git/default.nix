{ lib, config, ... }:

{
    options.desktopGit.enable = {
        type = lib.types.bool;
        default = true;
        description = "Enable Git";
    };

    options.desktopGit.username = {
        type = lib.types.str;
        default = "myusername";
        description = "Username to sign git";
    };

    options.desktopGit.email = {
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