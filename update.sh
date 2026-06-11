rm /etc/nixos/NixOS -R
git clone https://github.com/MiX-4401/NixOS.git /etc/nixos/NixOS
cd /etc/nixos/NixOS
git switch refactor
nixos-rebuild switch --flake /etc/nixos/NixOS