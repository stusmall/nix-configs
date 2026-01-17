{ pkgs, ... }:
{
  imports = [
    ./alacritty.nix
    ./bash.nix
    ./direnv.nix
    ./git.nix
    ./gnome.nix
    ./smartcard.nix
    ./zed.nix
    ./zellij.nix
  ];
  home.username = "stusmall";
  home.homeDirectory = "/home/stusmall";

  home.stateVersion = "22.11";

  nixpkgs.config.allowUnfree = true;

  home.packages = with pkgs; [
    chromium
    dig
    evince
    gnupg
    helix
    htop
    openssl
    pciutils
    ripgrep
    meld
    nixfmt-rfc-style
    nmap
    tokei
    tree
    trivy
    usbutils
    whois
    vlc
  ];
}
