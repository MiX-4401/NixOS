{ pkgs, ... }:

{
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        # User packages here
    ];

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
