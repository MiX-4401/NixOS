{ pkgs, lib, config, ... }:

{
    options = {
        desktop.idleController = {
            enable = lib.mkOption {
                type = lib.types.bool;
                default = false;
                description = "Enable desktop idle for sleep and hibernation";
            };

            lockAfter = lib.mkOption {
                type = lib.types.int;
                default = 60;
                description = "Seconds until the computer locks";
            };

            sleepAfter = lib.mkOption {
                type = lib.types.int;
                default = 120;
                description = "Seconds until the computer suspends";
            };
        };
    };

    config = lib.mkIf config.desktop.idleController.enable {

        # Hyperland idler services as Hyprland does not directly communicate with systemd idle services on it's own        
        home.packages = with pkgs; [ hypridle ];

        services.hypridle = {
            enable = true;
            settings = {
                
                general = {
                    lock_cmd = "hyprlock";
                    before_sleep_cmd = "loginctl lock-session";
                    after_sleep_cmd = "hyprctl dispatch dpms on";
                };
                
                listener = [
                    
                    # Idle lock listener
                    {
                        on-timeout = "hyprlock";
                        timeout = config.desktop.idleController.lockAfter;
                    }

                    # Idle sleep listener
                    {
                        on-timeout = "systemctl suspend-then-hibernate";
                        timeout = config.desktop.idleController.sleepAfter;
                    }
                ];
            };
        };
    };
}  