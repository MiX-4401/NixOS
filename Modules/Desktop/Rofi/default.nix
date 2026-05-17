{ ... }:

{
    home.file.".config/rofi/myConfig.rasi" = {
        source = ./myConfig.rasi;
    };

    programs.rofi = {
        enable = true;
        configPath = "$XDG_CONFIG_HOME/rofi/myConfig.rasi";
    };
}