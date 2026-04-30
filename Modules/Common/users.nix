{ config, pkgs, ... }:

{
    users.users.nixuser = {
        isNormalUser = true;
        extraGroups = [ "wheel" ];
        shell = pkgs.zsh;
        password = "nixuser";
    };

    programs.zsh = {
        enable = true;
        autosuggestions.async = true;
        autosuggestions.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            c = "clear";
        };     
    };
}