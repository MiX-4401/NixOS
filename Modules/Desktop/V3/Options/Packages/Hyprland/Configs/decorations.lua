hl.config({

    -- Looks
    general = {
        layout = "dwindle";

        gaps_in = 5;
        gaps_out = 20;
        border_size = 2;

        resize_on_border = false; 
        allow_tearing = false;

        -- col.inactive_border = 
        -- col.active_border   =
    
    };

    decoration = {
        rounding = 5;
        active_opacity = 0.8;
        inactive_opacity = 0.7;

        blur = {
            enabled = true;
            xray = true;
            ignore_opacity = true;
            
            size = 10;
            passes = 4;
            contrast = 2.0;
            vibrancy =  0.0;
            brightness = 0.4;
            vibrancy_darkness = 1.0;
            new_optimizations = true;
        };

        shadow = {
            enabled = true;
            range = 10;
            render_power = 2;
            -- sharp
            -- color
            -- color_inactive
            -- offset
            -- scale
        };
    };

    -- decoration.glow = {
    --     enabled = true;
    --     range
    --     render_power
    --     color
    --     color_inactive   
    -- }
    
    -- Misc
    misc = {
        animate_manual_resizes = true;
        animate_mouse_windowdragging = true;
        disable_hyprland_logo = true;
        disable_splash_rendering = true;
    };

    xwayland = {
        enabled = true;
        force_zero_scaling = true;
    };

    render = {
        direct_scanout = 1;
    };

    ecosystem = {
        no_update_news = true;
        no_donation_nag = true;
    };

    -- Layouts
    master = {
        new_status = "slave";
        mfact = 0.70;
    };
})