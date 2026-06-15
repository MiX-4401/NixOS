{ inputs, username, ... }: 

{
    # Import HomeManager libraries
    imports = [
        inputs.home-manager.nixosModules.home-manager
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
    home.packages = [
        
        # Destop environment
        pkgs.clipse
        pkgs.hyprshot
        pkgs.pavucontrol
        pkgs.wl-clipboard
        pkgs.font-awesome_5
        pkgs.breeze-hacked-cursor-theme

        # User GUI applications
        pkgs.nautilus
        pkgs.bitwarden-desktop                
        pkgs.vscode
        
        # User TUI applications
        pkgs.yazi
        pkgs.btop

        # User CLI applications
        pkgs.python3
        
        # External flake packages
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
    ];
}