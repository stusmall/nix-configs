{ lib, ... }:
{
  dconf.settings = {
    "org/gnome/calculator" = {
      # Disable currency conversion refresh
      refresh-interval = 0;
    };
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      # Added for: https://github.com/alacritty/alacritty/issues/4780#issuecomment-859481392
      cursor-theme = "Adwaita";
      show-battery-percentage = true;
    };
    "org/gnome/desktop/screensaver" = {
      lock-enabled = true;
    };
    # Screen blanks after 15 minutes
    "org/gnome/desktop/session" = {
      idle-delay = lib.hm.gvariant.mkUint32 900;
    };
    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };
    # Use stacked area chart to better show utilization in systems with many CPUs
    "org/gnome/gnome-system-monitor" = {
      cpu-stacked-area-chart = true;
    };
    # Suspend after 15 minutes
    "org/gnome/settings-daemon/plugins/power" = {
      sleep-inactive-ac-type = "suspend";
      sleep-inactive-ac-timeout = 900;
      sleep-inactive-battery-type = "suspend";
      sleep-inactive-battery-timeout = 900;
    };
    "org/gnome/shell" = {
      enabled-extensions = [
        "appindicatorsupport@rgcjonas.gmail.com"
        "dash-to-dock@micxgx.gmail.com"
      ];
      favorite-apps = [
        "Alacritty.desktop"
        "firefox.desktop"
        "signal-desktop.desktop"
        "dev.zed.Zed.desktop"
      ];
    };
    "org/gnome/shell/extensions/dash-to-dock" = {
      apply-custom-theme = true;
    };
    "org/gnome/system/location" = {
      enabled = false;
    };
  };

  xdg.mimeApps.defaultApplications = {
    "text/html" = "firefox.desktop";
    "x-scheme-handler/http" = "firefox.desktop";
    "x-scheme-handler/https" = "firefox.desktop";
  };
}
