{ lib, config, ... }:

{
    boot = {
        plymouth = {
            enable = lib.mkForce true;
            theme = lib.mkForce "spinner";
        };

        initrd.systemd.enable = true;

        # Enable "Silent boot"
        consoleLogLevel = 3;
        initrd.verbose = false;
        kernelParams = [
            "quiet"
            "splash"
            # "boot.shell_on_fail"
            "rd.udev.log_level=3"
            "rd.systemd.show_status=auto"
        ];

        # Hide the OS choice for bootloaders.
        # It's still possible to open the bootloader list by pressing any key
        # It will just not appear on screen unless a key is pressed
        loader.timeout = 0;
    };
}