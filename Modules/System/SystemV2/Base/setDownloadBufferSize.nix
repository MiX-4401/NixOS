{ lib, config, ... }:

{
    options.baseSetDownloadBufferSize.size = lib.mkOption {
        type = lib.types.int;
        default = 67108864;
        description = "Set the download buffer size for Nix downloads";
    };

    config = {
        nix.settings.download-buffer-size = config.baseSetDownloadBufferSize.size;
    };
}