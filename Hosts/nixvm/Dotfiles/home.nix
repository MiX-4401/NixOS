{ pkgs, ... }:

{
    home.packages = with pkgs; [
        ncdu
    ]

    home.file.".zshrc".source = ./.zshrc;
}