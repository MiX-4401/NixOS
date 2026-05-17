{ ... }:

{
    home.file.".config/rofi/config.rasi" = {
        source = config.rasi;
    };

    programs.rofi = {
        enable = true;
    };
}