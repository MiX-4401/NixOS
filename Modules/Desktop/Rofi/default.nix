{ ... }:

{
    home.file.".config/rofi/" = {
        source = ./myConfig.rasi;
    };

    programs.rofi = {
        enable = true;
    };
}