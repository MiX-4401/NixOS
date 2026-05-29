{ ... }:

{
    home.file.".config/rofi/myRofi.rasi" = {
        source = ./rounded-template.rasi;
    };
    programs.rofi = {
        enable = true;
        configPath = ".config/rofi/myRofi.rasi";
    };
}