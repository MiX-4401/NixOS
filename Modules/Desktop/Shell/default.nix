{ ... }:

{
    programs.zsh = {
        enable = true;
        autosuggestion.async = true;
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
            path = "~/.zshhistory";
        };
    };
}
