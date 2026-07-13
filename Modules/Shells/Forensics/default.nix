{ pkgs ? import <nixpkgs> {}, lib, ... }:

{
    options = lib.mkIf core.shells.forensics {
        enable = {
            type = lib.types.bool;
            default = false;
            description = "Enable the shell environment for forensics";
        };
    };

    config = lib.mkIf config.core.shells.forensics.enable {
        pkgs.mkShell {
            nativeBuildInputs = with pkgs.buildPackages; [
                file    # File metadata examiner tool
            ];
        };
    };
}

