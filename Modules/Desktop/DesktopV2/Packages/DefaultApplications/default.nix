{ lib, config, ... }:

{
    options.desktopDefaultApps.enable = lib.mkOption {
        type = lib.types.bool;
        default = true;
        description = "Enable the default application handlers";
    };

    options.desktopDefaultApps.defaultBrowser = lib.mkOption {
        type = lib.types.str;
        default = "zen.desktop";
    };

    config = {
        xdg.mimeApps = {
            enable = config.desktopDefaultApps.enable;
            defaultApplications = {
                "text/html" = config.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/http" = config.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/https" = config.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/about" = config.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/unknown" = config.desktopDefaultApps.defaultBrowser;
            };
        };
    };
}