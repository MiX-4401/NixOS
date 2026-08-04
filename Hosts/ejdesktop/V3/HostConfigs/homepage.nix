{ pkgs, ... }:

{
    services.homepage-dashboard = {
        enable = true;

        # # https://gethomepage.dev/latest/configs/settings/
        # settings = {};

        # https://gethomepage.dev/latest/configs/bookmarks/
        bookmarks = [
            {
                Youtube = [
                    {
                        abbr = "YT";
                        href = "https://youtube.com";
                    }
                ];
            }
        ];

        # # https://gethomepage.dev/latest/configs/services/
        # services = [];

        # # https://gethomepage.dev/latest/configs/service-widgets/
        # widgets = [];

        # # https://gethomepage.dev/latest/configs/kubernetes/
        # kubernetes = { };

        # # https://gethomepage.dev/latest/configs/docker/
        # docker = { };

        # # https://gethomepage.dev/latest/configs/custom-css-js/

        # customJS = "";
        # customCSS = "";
    };
}