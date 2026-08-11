{ inputs, pkgs, username, ... }: 

{

    # Import modular settings
    imports = [
        ./Options/NixOS/moduleBundle.nix
        ./Options/Nix/moduleBundle.nix
        ./Options/Security/moduleBundle.nix
        ./Options/Misc/moduleBundle.nix
    ];

    # NixOS
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    # Umask
    environment.extraInit = "umask 0077";

    # Boot
    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;
    
    # Time/language/keyboard settings
    time.timeZone = "Australia/Melbourne";
    i18n.defaultLocale = "en_AU.UTF-8";
    services.xserver.xkb.layout = "au";
    services.xserver.xkb.variant = "";

    # Services
    services = {
        upower.enable = true;
        displayManager.ly.enable = true;
        displayManager.ly.settings = { save = false; };
    };

    # Networking

    networking.networkmanager = { # Networkmanager for Wifi
        enable = true;
    };

    # systemd.network = { # Systemd network for static configurations (ethernet)
    #     enable = true;
    #     wait-online.enable = false; # Stop conflicts between nm and systemdnetwork
    # };

    # Set umask
    security.loginDefs.settings.UMASK = "077";

    # Users
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" "networkmanager" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };

    users.motd = ''
        ╔══════════════════════════════════════════════════════════════╗
        ║                 ⚠️  AUTHORIZED ACCESS ONLY  ⚠️               ║
        ╠══════════════════════════════════════════════════════════════╣
        ║                                                              ║
        ║  This system is restricted to authorised users only.         ║
        ║                                                              ║
        ║  Unauthorised  access, use, modification, or interference    ║
        ║  is strictly prohibited and may be monitored, logged, and    ║
        ║  reported to the appropriate authorities.                    ║
        ║                                                              ║
        ║  If you are not explicitly authorised to access this system, ║
        ║  disconnect immediately.                                     ║
        ║                                                              ║
        ║                 KEEP OUT. YOU HAVE BEEN WARNED.              ║
        ║                                                              ║
        ╚══════════════════════════════════════════════════════════════╝

    '';

    # System fonts
    fonts.packages = with pkgs; [
        noto-fonts      # My favorite font pack <|:P
    ];

    # System packages
    environment.systemPackages = with pkgs; [
        ly              # TUI Display manager 
        nethogs         # Network interface usage monitor 
        ncdu            # Filesystem size viewer (like WizTree)
        brightnessctl   # Screen brightness controls 
        dosfstools      # DOS file system libraries
        ntfs3g          # DOS file system libraries
    ];

    programs = {
        zsh.enable = true;      # CLI shell
        git.enable = true;      # CLI project manager
        htop.enable = true;     # Simple TUI resource monitor
        nano.enable = true;     # Simple TUI text editor

        hyprland.enable = true; # GUI Desktop environment  
        hyprland.withUWSM = true;       
        hyprland.xwayland.enable = true; 
    };
}