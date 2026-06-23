{ pkgs, ... }: 

{
    home.packages = with pkgs; [ walker elephant ];
    services.walker = {
        enable = true;
        systemd.enable = true;
        enableElephantIntegration = true;

        # settings = {
        #     app_launch_prefix = "";
        #     as_window = false;
        #     close_when_open = false;
        #     disable_click_to_close = false;
        #     force_keyboard_focus = true;
        #     terminal_title_flag = "";
        #     theme = "default";
        #     timeout = 20;
        # };
    };

    services.elephant = {
        enable = true;

        # settings = {
        #     app_launch_prefix = "";
        #     as_window = false;
        #     close_when_open = false;
        #     disable_click_to_close = false;
        #     force_keyboard_focus = true;
        #     terminal_title_flag = "";
        #     theme = "default";
        #     timeout = 20;
        # };
    };
}
