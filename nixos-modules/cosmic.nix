{ pkgs, ... }:
{
  services.displayManager.cosmic-greeter.enable = true;
  services.desktopManager.cosmic.enable = true;
  services.displayManager.autoLogin = {
    enable = true;
    user = "stusmall";
  };
  services.system76-scheduler.enable = true;
  environment.cosmic.excludePackages = with pkgs; [
    cosmic-edit
    cosmic-player
    cosmic-term
  ];
  services.gnome.gnome-keyring.enable = false;
  hardware.system76.power-daemon.enable = true;

  environment.systemPackages = with pkgs; [
    cosmic-ext-calculator
    cosmic-ext-tweaks
  ];
}
