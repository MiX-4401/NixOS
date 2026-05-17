{ ... }: 

{
    services.walker = {
        enable = true;
        systemd.enable = true;

        settings = {
            app_launch_prefix = "";
            as_window = false;
            close_when_open = false;
            disable_click_to_close = false;
            force_keyboard_focus = true;
            terminal_title_flag = "App Launcher";
            theme = "default";
            timeout = 20;
        };
    };
}
