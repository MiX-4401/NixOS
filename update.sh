rm /etc/nixos/NixOS -R
cp /home/ejradford/Documents/NixOS /etc/nixos -R
nixos-rebuild switch --flake /etc/nixos/NixOS
