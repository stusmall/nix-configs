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

  nixpkgs.config.allowUnfree = true;
  home.packages =
    with pkgs;
    [
      dig
      helix
      ripgrep
      nixfmt-rfc-style
      nmap
      tokei
      tree
      trivy
    ]
    ++ pkgs.lib.optionals pkgs.stdenv.isLinux [
      chromium
      evince
      openssl
      pciutils
      meld
      usbutils
      whois
      vlc
    ];

  home.stateVersion = "25.11";
}
