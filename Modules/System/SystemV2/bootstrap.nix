{ pkgs, ... }: 
{ username }:

{

    # Import modular settings
    imports = [
        ./Base/moduleBundle.nix
        ./Boot/moduleBundle.nix
        ./Security/moduleBundle.nix
    ];

    # NixOS
    nix.settings.experimental-features = [ "nix-command" "flakes" ];

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
    };

    # Users
    users.users.${username} = {
        isNormalUser = true;
        extraGroups = [ "wheel" "libvirtd" "networkmanager" ];
        shell = pkgs.zsh;
        initialPassword = username;
    };

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
    };
}