{ config, lib, ... }:

let
    colours = config.lib.stylix.colors;
in
{
    home.packages = [ pkgs.waybar ];
    programs.waybar = {
        enable = true;
        systemd.enable = true;

        settings = {
            mainBar = {
                layer = "top";
                position = "top";
                height = 12;
                width = 900;

                modules-left = [
                    "hyprland/workspaces"
                ];

                modules-center = [
                    "clock"
                ];

                modules-right = [
                    "cpu"
                    "battery"
                    "network"
                    "custom/notification"
                ];

                "hyprland/workspaces" = {
                # format = "";
                    persistent-workspaces = {
                        "*" = 6;
                    };
                };

                "clock" = {
                    format = "{:L%A: %H:%M}";
                };

                "battery" = {
                    format = "{capacity}% {icon}";
                    format-icons = {
                        "default" = [
                        "" # 0/4
                        "" # 1/4
                        "" # 2/4
                        "" # 3/4 
                        "" # 4/4
                        ];
                        "charging" = [
                            ""
                        ];
                    };
                    states."warning" = 30;
                    states."critical" = 15;
                };

                "network" = {
                    format = "{icon}";
                    format-icons = [
                    "" # Wifi weak 
                    "" # Wifi fiar
                    "" # Wifi max
                    ];
                    format-wifi = "{icon}";
                    format-ethernet = "";
                    format-disconnected = "";
                    format-linked = "";
                };

                "pulseaudio" = {
                    format = "{icon}";
                    format-icons = {
                        "default" = [
                        "" # Off
                        "" # Low
                        "" # High
                        ];
                    };
                };

                "custom/notification" = {
                    tooltip = true;
                    format = "<span size='16pt'>{icon}</span>";
                    format-icons = {
                        "notification" = "";
                        "none" = "";
                        "dnd-notification" = "";
                        "dnd-none" = "";
                        "inhibited-notification" = "󰂛";
                        "inhibited-none" = "󰪑";
                        "dnd-inhibited-notification" = "󰂛";
                        "dnd-inhibited-none" = "󰪑";
                    };
                    return-type = "json";
                    exec-if = "which swaync-client";
                    exec = "swaync-client -swb";
                    on-click = "swaync-client -t -sw";
                    on-click-right = "swaync-client -d -sw";
                    escape = true;
                };
            };
        };

        style = ''
            * {
                border: none;
                min-height: 0;
                font-family: 'Noto Sans Mono';
                font-weight: normal;
                font-size: 12px;
            }



            window#waybar  {
                background-color: #${colours.base00};
            }

            #waybar > box {
                background-color: alpha(#${colours.base00}, 0.5);
                color: #${colours.base0F};
                border-bottom: 2px solid alpha(#${colours.base0F}, 0.9);
                transition-property: background-color;
                transition-duration: .5s;
                border: 2.5px solid rgba(255, 255, 255, 0.1);
                border-radius: 6px;
                box-shadow: 0 1px 2px rgba(0, 0, 0, 1);
                margin: 0px 2px 2px 1px;
            }

            window {
                text-shadow: 0px 0px 2px alpha(#${colours.base0F}, 0.6);
                margin: 0;
                padding: 0;
                padding-top: 0px;
                font-size: 8px;
            }

            window#waybar.modules-left {
                margin-left: 0px;
                margin: 0;
                padding: 1.5px 0 1.5px;
                text-shadow: 0px 0px 2px alpha(#${colours.base0F}, 0.6);

            }
             
            window#waybar.modules-center {
                border-radius: 0;
                border-left: 1px solid alpha(#${colours.base0F}, 0.2);
                border-right: 1px solid alpha(#${colours.base0F}, 0.2);
                text-shadow: 0px 0px 2px alpha(#${colours.base0F}, 0.6);
                padding: 0 10px;
                padding-top: 0px;
            }
            
            window#waybar.modules-right {
                padding-top: 0px;
                margin-right: 2px;
                text-shadow: 0px 0px 2px alpha(#${colours.base0F}, 0.6);
            }

            #workspaces {
                padding: 1px 0px 1px;
                margin: 1px;
                border-radius: 2px;
                background: alpha(#${colours.base0F}, 0.1);
                opacity: 0.95;
            }

            #workspaces button {
                min-width: 15px;
                min-height: 8px;
                padding: 1px;
                margin: 1px 1px;
                border-radius: 2px;
                background-color: alpha(#${colours.base0F}, 0.75);
                opacity: 0.75;
                color: @background;
                font-size: 8px;
                transition: all 0.15s ease-in-out;
            }

            #workspaces button.active {
                background-color: alpha(#${colours.base0F}, 0.9);
                border-radius: 2px;
                color: @background;
                font-size: 8px;
                min-width: 25px;
                opacity: 1.0;
                transition: all 0.15s ease-in-out;
            }

            #workspaces button:hover {
                color: #${colours.base0F};
                background: alpha(#${colours.base00}, 0.1);
                border-radius: 2px;
                opacity: 1.0;
            }

            #workspaces button.empty {
                opacity: 0.25;
            }

            #custom-notification {
                font-family: "Noto Sans Mono";
                padding-right: 3px;
                margin-right: 3px;
            }
        '';
    };
}
