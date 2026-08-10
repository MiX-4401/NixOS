{ pkgs, lib, ... }:

{
    # security.pam.services = {
    #     login.u2fAuth = true;
    #     sudo.u2fAuth = true;
    # };

    # security.pam.u2f = {
    #     enable = true;
    #     control = "required";
    #     settings.interactive = true;
    #     settings.cue = true;
    #     settings.authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
            
    #         # Host login key 
    #         "ejradford:lfiQor/Y6GUyGMqAIESCk1PHGz7bh99vxlTZib53c2SMB5hTOFOQrPr2tW4HMVxA3d/Un7Wp5D/XhkljmSHV3Q==,5ioJnwPTlyvJNXTM6CzyOYwSTMz82nDOUlFXBgQ7oZTLlTKjJirXC9AWyRczp7jV4YzAF6AkZ8NcTf5iW41F1g==,es256,+presence"

    #         # Other keys
    #         # ...

    #     ]);
    # };

    # Enable YubiKey decryption for LUKs
    boot.initrd = lib.mkForce {
        luks.devices.crypted = {
            crypttabExtraOpts = [ "fido2-device=auto" ];
            device = "/dev/md127p1";
        };
        systemd.enable = true;
        systemd.fido2.enable = true;
    };
}