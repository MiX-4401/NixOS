{ lib, config, ... }:

{
    options.core.system.misc.gaming = {
        enable = lib.mkOption {
            type = lib.types.bool;
            default = false;
            description = "Enable gaming support";
        };
    };

    config = lib.mkIf (config.core.system.misc.gaming.enable) {
        programs.steam.enable = true;
        programs.steam.gamescopeSession.enable = true;

        programs.gamescope.enable = true;
        programs.gamescope.capSysNice = false;

        hardware.graphics.enable = true;
        hardware.graphics.enable32Bit = true;
    
        # programs.gamemode.enable = true;
    };
}