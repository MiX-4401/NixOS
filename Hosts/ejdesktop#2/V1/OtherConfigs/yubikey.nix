{ pkgs, lib, ... }:

{
    # Enable 2fa for PAM
    security.pam.services = {
        login.u2fAuth = true;
        sudo.u2fAuth = true;
    };

    # Enable YubiKey module (u2f protocol)
    security.pam.u2f = {
        enable = true;
        control = "required";
        settings.interactive = true;
        settings.cue = true;
        settings.authfile = pkgs.writeText "u2f-mappings" (lib.concatStrings [
            
            # Host login key 
            "ejradford:lfiQor/Y6GUyGMqAIESCk1PHGz7bh99vxlTZib53c2SMB5hTOFOQrPr2tW4HMVxA3d/Un7Wp5D/XhkljmSHV3Q==,5ioJnwPTlyvJNXTM6CzyOYwSTMz82nDOUlFXBgQ7oZTLlTKjJirXC9AWyRczp7jV4YzAF6AkZ8NcTf5iW41F1g==,es256,+presence"
            # ":C4svmxzQfe3fmhUEtlzyi0gABe3XyUKV+bqXQYlNPGecYgLl7uKQbRWsLGz0mxAB/bNl8OZAONPx4CNmVzaU4g==,jZqHWKlg0hfM62EWmL8M0T1A/yfJA/n03PBpl58DrxBMnw/9d88iItfnRoC16+GAc04VT/Pizh2CFGx5S54lxg==,es256,+presence%"
            # Other keys
            # ...

        ]);
    };
}
