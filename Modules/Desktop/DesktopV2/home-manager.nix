{ inputs, pkgs, username, ... }: 

{
    # Import HomeManager libraries
    imports = [
        inputs.home-manager.nixosModules.home-manager

        ./PacakgeBundles/Social/default.nix
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { inherit inputs; };
    home.username = "${username}";
    home.homeDirectory = "/home/${username}";
    home.stateVersion = "24.05";
    home-manager.users.${username} = {

        # Import desktop modules impacting the desktop environment (all modular settings)
        imports = [
            ./Packages/moduleBundle.nix
            ./PackageBundles/moduleBundle.nix
        ]; 
    };

    # Forced applications
    home.packages = with pkgs; [
        
        # Destop environment
        clipse
        hyprshot
        pavucontrol
        wl-clipboard
        font-awesome_5
        breeze-hacked-cursor-theme

        # User GUI applications
        nautilus
        bitwarden-desktop                
        vscode
        
        # User TUI applications
        yazi
        btop

        # User CLI applications
        python3
        
        # External flake packages
        inputs.zen-browser.packages.${stdenv.hostPlatform.system}.default
    ];
}