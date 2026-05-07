{ pkgs, ... }:

{
    home.stateVersion = "24.05";

    home.packages = with pkgs; [
        # User packages here
        ncdu
    ];

    # Example import: home.file.".zshrc".source = ./.zshrc; # This adds .zshrc to ~/.zshrc

    home.file.".zshrc".source = ./zsh/.zshrc;
    home.file.
}
