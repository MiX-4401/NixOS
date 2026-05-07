{ pkgs, ... }:

{
    # NixOS
    system.stateVersion = "24.05";
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Time/language/keyboard settings
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale.defaultLocale = "en_AU.UTF-8";
    services.xserver.xkb.layout = "au";
    services.xserver.xkb.variant = "";

    # System fonts
    fonts.packages = [
        pkgs.noto-fonts
    ];

    programs.zsh = {
        enable = true;
        autosuggestions.async = true;
        autosuggestions.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            c = "clear";
        };     
    };
}