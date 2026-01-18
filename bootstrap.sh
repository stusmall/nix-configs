#!/usr/bin/env bash
set -euo pipefail

function set_nixos_channels() {
    echo "Setting up NixOS channels"
    sudo nix-channel --add https://nixos.org/channels/nixos-25.11 nixos
    sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
    sudo nix-channel --update
    echo "Rebuilding NixOS"
    sudo nixos-rebuild build
}

function set_nix_darwin_channels() {
    echo "Setting up nix-darwin channels"
    # Currently Zed is broken on stable darwin.  Switching to unstable for now
    # sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/nix-darwin-25.11.tar.gz darwin
    # sudo nix-channel --add https://github.com/nix-community/home-manager/archive/release-25.11.tar.gz home-manager
    # sudo nix-channel --add https://channels.nixos.org/nixpkgs-25.11-darwin
    sudo nix-channel --add https://github.com/nix-darwin/nix-darwin/archive/master.tar.gz darwin
    sudo nix-channel --add https://github.com/nix-community/home-manager/archive/master.tar.gz home-manager
    sudo nix-channel --add https://channels.nixos.org/nixpkgs-unstable nixpkgs
    sudo nix-channel --update
    echo "Rebuilding nix-darwin"
    sudo darwin-rebuild switch
}

echo "Running the initial set up of the system..."
REPO_ROOT=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null &&  pwd )
echo "Setting symlinks to point to $REPO_ROOT"


echo "Which machine are we setting up?"
MACHINES=("Desktop" "Dell" "MacBook" "Exit")
select MACHINE in "${MACHINES[@]}"; do
  case $MACHINE in
    "Desktop")
      echo "Setting configuration.nix symlink"
      sudo rm -f /etc/nixos/configuration.nix || true
      sudo rm -f /etc/nixos/hardware-configuration.nix || true
      sudo ln -s "$REPO_ROOT"/hardware/desktop.nix /etc/nixos/configuration.nix
      set_nixos_channels
      break
      ;;
    "Dell")
      echo "Setting configuration.nix symlink"
      sudo rm -f /etc/nixos/configuration.nix || true
      sudo rm -f /etc/nixos/hardware-configuration.nix || true
      sudo ln -s "$REPO_ROOT"/hardware/dell.nix /etc/nixos/configuration.nix
      set_nixos_channels
      break
      ;;
    "MacBook")
      echo "Setting configuration.nix symlink"
      sudo mkdir -p /etc/nix-darwin || true
      sudo rm -f /etc/nix-darwin/configuration.nix || true
      sudo ln -s "$REPO_ROOT"/hardware/macbook.nix /etc/nix-darwin/configuration.nix
      set_nix_darwin_channels
      break
      ;;
    "Exit")
      echo "Cancelling setup"
      exit
      ;;
    *) echo -e "Invalid selection.  Please try again";;
esac
done

echo "All done!"
