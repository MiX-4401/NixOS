{ ... }:

{
    home.file."" = {
        source = ./myConfig.rasi;
    };

    programs.rofi = {
        enable = true;
    };
}