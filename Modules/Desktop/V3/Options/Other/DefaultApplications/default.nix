{ lib, config, ... }:

{
    options.desktop.other.defaultApplications.browser = lib.mkOption {
        type = lib.types.str;
        default = "zen.desktop";
        description = "Set the default browser";
    };

    config = {
        xdg.mimeApps = {
            enable = true;
            defaultApplications = {
                "text/html" = config.desktop.other.defaultApplications.browser;                    # HTML
                "x-scheme-handler/http" = config.desktop.other.defaultApplications.browser;        # HTTP
                "x-scheme-handler/https" = config.desktop.other.defaultApplications.browser;       # HTTPS
                "x-scheme-handler/about" = config.desktop.other.defaultApplications.browser;       # ABOUT
                "x-scheme-handler/unknown" = config.desktop.other.defaultApplications.browser;     # UNKNOWN
            };
        };
    };
}