{ lib, config, ... }:

{
    boot = {
        plymouth.enable = true;
        plymouth.theme = lib.mkForce "Fade-in";

        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "rd.udev.log_level=3"
            "rd.systemd.show_status=auto"
        ];
        loader.timeout = 0;
    };
}