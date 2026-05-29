{ pkgs, config, ... }:

{
    # NixOS
    system.stateVersion = "24.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

    # Garbage collection
    nix.gc = {
        automatic = true;
        dates = "weekly";
        options = "--delete-older-than 14d";
    };

    # Time/language/keyboard settings
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale = "en_AU.UTF-8";
    services.xserver.xkb.layout = "au";
    services.xserver.xkb.variant = "";

    # System fonts
    fonts.packages = [
        pkgs.noto-fonts
    ];
}
