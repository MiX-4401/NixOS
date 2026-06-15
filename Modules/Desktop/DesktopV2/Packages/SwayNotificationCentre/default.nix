{ config, ... }:

let
    inherit (config.lib.stylix.colors)
    base00 base01 base02 base03 base04
    base05 base06 base07 base08 base09
    base0A base0B base0C base0D base0E base0F;
in
{
    home.packages = [ pkgs.libnotify pkgs.swaynotificationcenter ];
    services.swaync = {
        enable = true;

        settings = {
            positionX = "right";
            positionY = "top";

            layer = "overlay";
            "layer-shell" = true;

            timeout = 10;
            fit-to-screen = true;

            control-center-width = 420;
            control-center-height = 0;

            "control-center-margin-top" = 12;
            "control-center-margin-right" = 12;
            "control-center-margin-bottom" = 12;

            image-visibility = "when-available";
            notification-window-width = 400;

            widgets = [
                "title"
                "buttons-grid"
                "mpris"
                "volume"
                "backlight"
                "notifications"
            ];

            "widget-config" = {

                title = {
                    text = "Notification Center";
                    clear-all-button = true;
                    button-text = "Clear";
                };

                volume = {
                    label = "";
                };

                backlight = {
                    label = "";
                };

                mpris = {
                    image-size = 92;
                    image-radius = 14;
                };

                "buttons-grid" = {
                    actions = [

                        {
                            label = "";
                            text = "WiFi";
                            type = "toggle";

                            command = ''
                                sh -c '
                                [[ $SWAYNC_TOGGLE_STATE == true ]] &&
                                    nmcli radio wifi on ||
                                    nmcli radio wifi off
                                '
                            '';

                            "update-command" = ''
                                sh -c '
                                nmcli radio wifi | grep -q enabled && echo true || echo false
                                '
                            '';
                        }

                        {
                            label = "";
                            text = "Bluetooth";
                            type = "toggle";

                            command = ''
                                sh -c '
                                [[ $SWAYNC_TOGGLE_STATE == true ]] &&
                                    bluetoothctl power on ||
                                    bluetoothctl power off
                                '
                            '';

                            "update-command" = ''
                                sh -c '
                                bluetoothctl show | grep -q "Powered: yes" && echo true || echo false
                                '
                            '';
                        }

                        {
                            label = "";
                            text = "DND";
                            type = "toggle";

                            command = ''
                                sh -c '
                                if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
                                    swaync-client --dnd-on
                                else
                                    swaync-client --dnd-off
                                fi
                                '
                            '';

                            "update-command" = ''
                                sh -c '
                                swaync-client -D | grep -q true && echo true || echo false
                                '
                            '';
                        }

                        {
                            label = "";
                            text = "Night";
                            type = "toggle";

                            command = ''
                                sh -c '
                                if [[ $SWAYNC_TOGGLE_STATE == true ]]; then
                                    hyprctl keyword decoration:screen_shader ~/.config/hypr/shaders/night.glsl
                                else
                                    hyprctl keyword decoration:screen_shader ""
                                fi
                                '
                            '';
                        }

                        {
                            label = "";
                            text = "Lock";
                            command = "hyprlock";
                        }

                        {
                            label = "";
                            text = "Logout";
                            command = "hyprctl dispatch exit";
                        }
                    ];
                };
            };

            style = ''
            * {
                font-family: "${config.stylix.fonts.sansSerif.name}";
                font-size: 14px;
                margin: 0;
                padding: 0;
            }

            /* =========================
                MAIN PANEL
            ========================== */

            .control-center {
                background: #${base00};
                border: 1px solid #${base02};
                border-radius: 20px;

                padding: 20px;
                margin: 12px;
            }

            /* =========================
                NOTIFICATIONS
            ========================== */

            .notification {
                background: #${base04};
                border-radius: 14px;
                border: 1px solid #${base02};
                
                margin: 10px;
            }

            .summary {
                color: #${base05};
                padding: 5px;
                font-weight: 600;
            }

            .body {
                color: #${base04};
                padding: 5px;
            }

            .time {
                color: #${base03};
                font-size: 12px;
                margin-top: 12px;
                margin-right: 70px;
            }

            .close-button {
                background: transparent;
                color: #${base05};

                margin-top: 20px;
                margin-right: 20px;

                border-radius: 999px;

                min-width: 24px;
                min-height: 24px;
            }

            .close-button:hover {
                background: #${base08};
                color: #${base00};
            }

            /* =========================
                TITLE
            ========================== */

            .widget-title {
                color: #${base0D};
                font-size: 18px;
                font-weight: 700;
                margin-bottom: 8px;
            }

            .widget-title > button {
                background: #${base08};
                color: #${base00};
                border-radius: 10px;
                padding: 6px 12px;
            }

            /* =========================
                SLIDERS
            ========================== */

            .widget-volume,
            .widget-backlight,
            .widget-mpris {
                background: #${base01};
                border-radius: 16px;
                border: 1px solid #${base02};

                padding: 16px 16px;
                margin: 8px 0;
            }

            .widget-volume box,
            .widget-backlight box {
                padding: 6px 0;
                spacing: 10px;
            }

            .widget-volume label,
            .widget-backlight label {
                margin-right: 10px;
                min-width: 24px;
            }

            scale {
                margin: 0;
                padding: 0;
            }

            scale trough {
                background: #${base02};
                border-radius: 999px;
                min-height: 6px;
            }

            scale slider {
                background: #${base0D};
                border-radius: 999px;
            }

            /* =========================
                BUTTON GRID
            ========================== */

            .widget-buttons-grid > flowbox > flowboxchild > button {
                background: #${base01};
                color: #${base05};
                border-radius: 14px;

                min-width: 74px;
                min-height: 74px;

                margin: 6px;
                border: 1px solid #${base02};

                transition: 150ms ease;
            }

            .widget-buttons-grid > flowbox > flowboxchild > button:hover {
                background: #${base02};
            }

            .widget-buttons-grid > flowbox > flowboxchild > button.toggle:checked {
                background: #${base0D};
                color: #${base00};
            }

            /* =========================
                EMPTY STATE → TEXT
            ========================== */

            .notification-list:empty {
                padding: 20px;
                margin: 0;
            }

            .notification-list:empty::after {
                content: "All caught up";
                display: block;

                text-align: center;
                color: #${base03};

                font-size: 14px;
                font-weight: 500;

                padding: 20px;
            }

            .notification-list image {
                opacity: 0;
                min-width: 0;
                min-height: 0;
            }

            /* =========================
                MPRIS
            ========================== */

            .mpris-title {
                color: #${base05};
                font-weight: 700;
            }

            .mpris-subtitle {
                color: #${base04};
            }

            scrollbar {
                opacity: 0;
            }
            '';
        };
    };
}