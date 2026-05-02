{ ... }:

{
    # SSHD
    programs.ssh = {
        enableAskPassword = true;
        extraConfig = ''
port = 7195
        ''
    };

    networking.firewalld = {
        enable = true;
    };
}
