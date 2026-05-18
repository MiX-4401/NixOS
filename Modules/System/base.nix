{ pkgs, ... }:

{
    # NixOS
    system.stateVersion = "24.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

    # Time/language/keyboard settings
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale = "en_AU.UTF-8";
    services.xserver.xkb.layout = "au";
    services.xserver.xkb.variant = "";

    # Enable Ly as the display manager
    services.displayManager.ly.enable = true;

    # System fonts
    fonts.packages = [
        pkgs.noto-fonts
    ];
}