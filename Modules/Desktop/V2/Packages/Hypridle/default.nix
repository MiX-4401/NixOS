{ pkgs, ... }:

{
    home.packages = with pkgs; [ hyprpaper ];

    services.hypridle = {
        enable = true;
        settings = {
            general = {
                lock_cmd = "hyprlock";
                before_sleep_cmd = "loginctl lock-session";
                after_sleep_cmd = "hyprctl dispatch dpms on";
            };
            listener = [
                {
                    on-timeout = "hyprlock";
                    timeout = 60;
                }
                {
                    on-timeout = "systemctl suspend-then-hibernate";
                    timeout = 120;
                }
                # {
                #     on-resume = "hyprctl dispatch dpms on";
                #     on-timeout = "hyprctl dispatch dpms off";
                #     timeout = 1200;
                # }
            ];
        };
    };
}  