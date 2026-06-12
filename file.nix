# { ... }:

# let
#     sshSettings = {
#         ports = [ 10, 11 ];
#     };
# in
# {
#     services.openssh = (sshSettings // { enable = true; });
# }

{ ... }:

{
    services.openssh = let 
        setPorts = myports: {
            ports = myports;
            settings.PermitRootLogin = true;
            settings.AllowUsers = false;
        };
    in

    {
        
    };
}