{ pkgs, ... }:

{
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        # User packages here
    ];

    # Hyprpaper
    services.hyprpaper = {
        enable = true;
        settings = {
            preload = [
            "~/.config/hypr/Wallpapers/rainworld7.webp"
            ];
            wallpaper = [
            # By display
            # {
            #   monitor = "DP-2";
            #   path = "~/wallpapers/wallpaper2.jpg";
            # }
            # By default/fallback
            {
                monitor = "";
                path = "~/.config/hypr/Wallpapers/rainworld7.webp"; 
            }
            ];
        };
    };

    # Example import: home.file.".zshrc".source = ./.zshrc; # This adds .zshrc to ~/.zshrc

    home.file.".zshrc" = {
        source = ./zsh/.zshrc;
    };
    home.file.".config/hypr" = {
        source = ./hypr;
        recursive = true;
    };
    home.file.".config/dunst" = {
        source = ./dunst;
        recursive = true;
    };
    home.file.".config/btop" = {
        source = ./btop;
        recursive = true;
    };
    home.file.".config/kitty" = {
        source = ./kitty;
        recursive = true;
    };
    home.file.".config/quickshell" = {
        source = ./quickshell;
        recursive = true;
    };
    home.file.".config/rofi" = {
        source = ./rofi;
        recursive = true;
    };
}
