{ ... }:

{
    home.packages = [ pkgs.waypaper ];
    home.file.".config/waypaper/config.ini" = {
        source = ./config.ini;
    };
}