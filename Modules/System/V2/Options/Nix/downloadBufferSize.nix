{ pkgs, lib, config, ... }:

{
    options.core.system.nix.downloadBufferSize = lib.mkOption {
        type = lib.types.int;
        default = 67108864;
        description = "Set the download buffer size for Nix in mb";
    };

    config = {
        nix.settings.download-buffer-size = config.core.system.nix.downloadBufferSize;
    };
}