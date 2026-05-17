{ ... }:

{
    home.file.".config/rofi/" = {
        source = ./config.rasi;
    };

    programs.rofi = {
        enable = true;
    };
}