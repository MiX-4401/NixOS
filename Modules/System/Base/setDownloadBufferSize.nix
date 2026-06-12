{ lib, config, ... }:

{
    options = {
        BaseSetDownloadBufferSize.size = lib.mkOption {
            type = lib.types.int;
            default = 67108864;
            description = "Set the download buffer size for Nix downloads";
        };
    };

    config = {

        # Set download buffer settings
        nix.settings.download-buffer-size = config.BaseSetDownloadBufferSize.size;
    };
}