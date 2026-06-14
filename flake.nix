{
    description = "System Configuration";
    
    # 
    inputs = {

    };

    outputs = { self, nixpkgs, ... } @ inputs: let
        mkHost = import ./Lib/moduleBundle.nix {
            inherit inputs; 
            inherit self;
        };
    in { # Hosts

        ejdesktop = mkHost {
            hostname = "ejdesktop";
            system = "x86_64-linux";
            modules = [ ./Hosts/ejdesktop/configuration.nix ];
        };
    };
}