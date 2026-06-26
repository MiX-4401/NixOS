{ inputs, config, lib, pkgs, username, ... }: 

{
    # Import HomeManager libraries
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./Packages/moduleBridge.nix
        ./PackageBundles/moduleBridge.nix
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { 
        inherit inputs; 
        inherit username;
        desktopSetWallpaper = config.desktopSetWallpaper;   # Passthrough toplevel value to home-manager's scope
    };
    
    home-manager.users.${username} = {
        home.username = "${username}";
        home.homeDirectory = "/home/${username}";
        home.stateVersion = "26.05";
        imports = [
            # Import desktop modules impacting the desktop environment (all modular settings)
            ./Packages/moduleBundle.nix
            ./PackageBundles/moduleBundle.nix
        ]; 

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

            # bitwarden-desktop          
            vscode
            
            # User TUI applications
            yazi
            btop

            # User CLI applications
            python3
            
            # External flake packages
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default
        ];
    };
}