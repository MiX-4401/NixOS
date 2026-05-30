{ config, lib, username, wallpaper, ... }:

{
  programs.hyprlock = {
    enable = true;

    settings = {
      background = {
        blur_passes = 2;
        contrast = 0.8916;
        brightness = 0.8172;
        vibrancy = 0.1696;
        vibrancy_darkness = 0.0;

        # path = "/home/${username}/Pictures/Wallpapers/${wallpaper}";
      };

      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading_bar = false;
      };

    #   input-field = lib.mkForce [
    #     {
    #       position = lib.mkForce "0, 225";
    #       halign = lib.mkForce "center";
    #       valign = lib.mkForce "bottom";
    #     }
    #   ];

      image = [
        {
          path = "${config.home.homeDirectory}/.config/hypr/Wallpapers/rainworld9.jpg";

        #   border_color = "0xffdddddd";
          border_size = 0;

          size = 120;
          rounding = -1;

          rotate = 0;
          reload_time = -1;

          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];

      label = [
        # Time
        {
          text = "cmd[update:1000] echo \"<span>$(date +'%H:%M')</span>\"";

          color = "rgba(216, 222, 233, 0.70)";
          font_size = 130;
          font_family = "SF Pro Display Bold";

          position = "0, 340";
          halign = "center";
          valign = "center";
        }

        # Date
        {
          text = "cmd[update:1000] echo \"$(date +'%A, %d %B')\"";

          color = "rgba(216, 222, 233, 0.70)";
          font_size = 30;
          font_family = "SF Pro Display Bold";

          position = "0, 205";
          halign = "center";
          valign = "center";
        }

        # User
        {
          text = "Hi, $USER";

          color = "rgba(216, 222, 233, 0.70)";
          font_size = 25;
          font_family = "SF Pro Display Bold";

          position = "0, 130";
          halign = "center";
          valign = "bottom";
        }
      ];
    };
  };
}