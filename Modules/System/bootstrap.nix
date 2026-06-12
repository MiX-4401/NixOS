{ inputs, pkgs, username, ... }: 

{

    # NixOS
    nix.settings.experimental-features = [ "nix-command" "flakes" ];
    environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];

    # Time/language/keyboard settings
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale = "en_AU.UTF-8";
    services.xserver.xkb.layout = "au";
    services.xserver.xkb.variant = "";

    # System fonts
    fonts.packages = [
        pkgs.noto-fonts
    ];
    
    # Systemd boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_zen;

    # Networking
    networking.networkmanager = {
        enable = true;
    };

    # Global packages
    environment.systemPackages = with pkgs; [
        ly
        timeshift
        nethogs
        ncdu
        brightnessctl
        dosfstools
        ntfs3g
    ];

    imports = [
        inputs.hyprland.nixosModules.default
    ];

    programs = {
        git.enable = true;
        htop.enable = true;
        nano.enable = true;
        zsh.enable = true;
        steam.enable = true;
        gamescope.enable = true;

        hyprland = {
            enable = true;
            pacakge = inputs.hyprland.packages.${pkgs.stdenv.hostPlatform.system}.default;
        };
    };

    # Services
    services.upower = {
        enable = true;
    };

    services.displayManager.ly = {
        enable = true;
    };

    # Users
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };
}