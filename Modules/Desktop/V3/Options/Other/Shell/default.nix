{ config, ... }:

{
    programs.zsh = {
        enable = true;
        autosuggestion.enable = true;
        enableCompletion = true;
        syntaxHighlighting.enable = true;
        shellAliases = {
            c = "clear";
            ls = "ls --color=auto";
        };
        history = {
            save = 1000;
            size = 1000;
            path = "${config.home.homeDirectory}/.zshhistory";
        };

        initContent = ''
            # [Ctrl-RightArrow] - move forward one word
            bindkey '^[[1;5C' forward-word
            # [Ctrl-LeftArrow] - move backward one word
            bindkey '^[[1;5D' backward-word
        '';
    };
}
