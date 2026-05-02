{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ncdu
    ];

    home.file.".zshrc".source = ./.zshrc;
    home.stateVersion = "24.05";
}