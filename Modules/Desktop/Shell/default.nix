{ ... }:

{
    programs.zsh = {
        enable = true;
        autosuggestions.async = true;
        autosuggestions.enable = true;
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
