{ lib, config, ... }:

{
    options.desktopDefaultApps.enable = {
        type = lib.types.bool;
        default = true;
        description = "Enable the default application handlers";
    };

    options.desktopDefaultApps.defaultBrowser = {
        type = lib.types.str;
        default = "zen.desktop";
    };

    config = {
        xdg.mimeApps = {
            enable = config.desktopDefaultApps.enable;
            defaultApplications = {
                "text/html" = options.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/http" = options.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/https" = options.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/about" = options.desktopDefaultApps.defaultBrowser;
                "x-scheme-handler/unknown" = options.desktopDefaultApps.defaultBrowser;
            };
        };
    };
}