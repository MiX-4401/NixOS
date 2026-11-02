{ inputs, config, lib, pkgs, username, ... }: 

{
    # Import HomeManager libraries
    imports = [
        inputs.home-manager.nixosModules.home-manager
        ./Options/moduleBridge.nix
        
    ];

    home-manager.useGlobalPkgs = true;
    home-manager.useUserPackages = true;
    home-manager.extraSpecialArgs = { 
        inherit inputs; 
        inherit username;
        wallpaper = config.core.system.misc.wallpaper.filename;   # Passthrough toplevel value to home-manager's scope
    };
    
    home-manager.users.${username} = {
        home.username = "${username}";
        home.homeDirectory = "/home/${username}";
        home.stateVersion = "26.05";
        imports = [
            ./Options/moduleBundle.nix
        ]; 
        
        # Forced applications
        home.packages = with pkgs; [
            
            # Destop environment
            clipse                          # Clipboard (tui)
            hyprshot                        # Screenshotting
            pavucontrol                     # Volume control
            wl-clipboard                    # Clipboard support
            font-awesome_5                  # Font support
            breeze-hacked-cursor-theme      # Mouse icon pack

            # User GUI applications
            nautilus                        # Filemanager (GTK)
            bitwarden-desktop               # PasswordManager      
            vscode                          # Coding IDE
            
            # User TUI applications
            yazi                            # Filemanager
            superfile                       # Filemanager
            btop                            # Resource monitor
            systemd-manager-tui             # SystemD service manager 

            # User CLI applications
            python3                         # Programming
            
            # External flake packages
            inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.default  # Browser
        ];
    };
}