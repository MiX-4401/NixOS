{ pkgs, ... }:

pkgs.mkShell {
    packages = with pkgs; [
        file
    ];
}