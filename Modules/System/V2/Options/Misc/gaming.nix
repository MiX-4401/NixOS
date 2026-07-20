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
        programs.gamescope.capSysNice = true;
        
        hardware.opengl.enable = true;
        hardware.opengl.driSupport32Bit = true;
    
        # programs.gamemode.enable = true;
    };
}