{ ... }:

{
    home.file."config/rofi/config.rasi" = {
        source = ./rounded-template.rasi;
    };
    programs.rofi = {
        enable = true;
    };
}