{ pkgs, ... }:

{
    services.glances = {
        enable = true;
    };

    services.scrutiny = {
        enable = true;
        collector.enable = true;
        settings.web.listen.port = 7591;
    };

    services.smartd = {
        enable = true;
        autodetect = true;
    };

    services.homepage-dashboard = {
        enable = true;

        # https://gethomepage.dev/latest/configs/settings/
        settings = {
            title = "Homepage";
            description = "Hello World!";
            background = {
                image = "https://images.unsplash.com/photo-1502790671504-542ad42d5189?auto=format&fit=crop&w=2560&q=80";
                blur = "sm";
                saturate = 50;
                opacity = 50;
                brightness = 50;
            };
            # headerStyle = "underlined";
            # logpath = "/home/ejradford/log";

            layout = [
                {
                    MyGroup = {
                        style = "row";
                        columns = 2;
                        iconsOnly = false;
                    };
                }

                {
                    "Hardware Monitor" = {
                        style = "row";
                        columns = 3;  
                    };
                }
            ];
        };

        # https://gethomepage.dev/latest/configs/bookmarks/
        bookmarks = [
            {
                MyGroup = [
                    {
                        Github = [
                            {
                                abbr = "GH";
                                href = "https://github.com/";
                            }
                        ];
                    }

                    {
                        Youtube = [
                            {
                                abbr = "YT";
                                href = "https://youtube.com/";
                            }
                        ];
                    }
                ]; 
            }
        ];

        # https://gethomepage.dev/latest/configs/services/
        services = [
            {
                "Hardware Monitor" = [
                    {
                        "Info".widget = {
                            type = "glances";
                            url = "http://127.0.0.1:61208";
                            version = 4;
                            metric = "info";
                            chart = false;
                        };
                    }

                    {
                        "Network".widget = {
                                type = "glances";
                                url = "http://127.0.0.1:61208";
                                version = 4;
                                metric = "network:enp37s0";
                                chart = false;
                        };
                    }
                    
                    {
                        "Memory".widget = {
                            type = "glances";
                            url = "http://127.0.0.1:61208";
                            version = 4;
                            metric = "mem";
                            chart = false;
                        };
                    }


                    {
                        "SMART".widget = {
                            type = "scrutiny";
                            url = "http://0.0.0.0:7591";
                            version = 4;
                            metric = "mem";
                            chart = false;
                        };
                    }
                ];
            }
        ];

        # https://gethomepage.dev/latest/configs/service-widgets/
        # widgets = [
        #     # {
        #     #     greeting = {
        #     #         text_size = "xl";
        #     #         text = "Greetings MiX!";
        #     #     };
        #     # }

        #     # {
        #     #     resources = {
        #     #         cpu = true;
        #     #         disk = "/";
        #     #         memory = true;
        #     #         cputemp = true;
        #     #         uptime = true;
        #     #         network = true;  
        #     #     };
        #     # }

        #     # {
        #     #     openmeteo = {
        #     #         label = "Australia";
        #     #         latitude = 37.8136;
        #     #         lonitude = 144.9631;
        #     #         timezone = "Australia/Melbourne";
        #     #         units = "metric";
        #     #         cache = 5;
        #     #     };
        #     # }

        #     # {
        #     #     glances = {
        #     #         url = "http://127.0.0.1:61208";
        #     #         version = 4;
        #     #         cpu = true;
        #     #         mem = true;
        #     #         cputemp = true;
        #     #         unit = "metric";
        #     #         disk = "/";
        #     #         expanded = true;
        #     #     };
        #     # }
        # ];

        # # https://gethomepage.dev/latest/configs/kubernetes/
        # kubernetes = { };

        # # https://gethomepage.dev/latest/configs/docker/
        # docker = { };

        # # https://gethomepage.dev/latest/configs/custom-css-js/

        # customJS = "";
        # customCSS = "";
    };
}