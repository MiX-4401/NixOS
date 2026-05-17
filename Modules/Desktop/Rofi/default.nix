{ ... }:

{
    home.file."file" = {
        source = ./myConfig.rasi;
    };

    programs.rofi = {
        enable = true;
    };
}