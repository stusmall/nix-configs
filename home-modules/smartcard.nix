{ pkgs, ... }:
{
  home.packages = with pkgs; [
    gnupg
  ];

  services.gpg-agent = {
    enable = true;
    enableScDaemon = true;
    enableSshSupport = true;
    defaultCacheTtl = 60;
    maxCacheTtl = 120;
    pinentry.package =
      if pkgs.stdenv.hostPlatform.isLinux then pkgs.pinentry-curses else pkgs.pinentry_mac;
  };
}
