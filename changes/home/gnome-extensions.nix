{
  config,
  lib,
  pkgs,
  ...
}:
{
  programs.gnome-shell = {
    enable = true;
    extensions = [
      { package = pkgs.gnomeExtensions.appindicator; }
      { package = pkgs.gnomeExtensions.caffeine; }
      { package = pkgs.gnomeExtensions.clipboard-indicator; }
      { package = pkgs.gnomeExtensions.user-themes; }
      { package = pkgs.gnomeExtensions.alphabetical-app-grid; }
      { package = pkgs.gnomeExtensions.system-monitor; }
      { package = pkgs.gnomeExtensions.dock-from-dash; }
    ];
  };

  dconf.settings = {

    "org/gnome/shell" = {
      disable-user-extensions = false;
      enabled-extensions = [ "user-theme@gnome-shell-extensions.gcampax.github.com" ];
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-brightness = -0.1;
      icon-opacity = 255;
      icon-saturation = 0.8;
      icon-size = 18;
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position = -1;
      indicator-position-index = -1;
      screen-blank = "never";
      show-indicator = "only-active";
      show-notifications = false;
      toggle-shortcut = [ "<Super>c" ];
    };

    "org/gnome/shell/extensions/clipboard-indicator" = {
      cache-size = 10;
      disable-down-arrow = false;
      display-mode = 0;
      history-size = 200;
      strip-text = true;
      topbar-preview-size = 8;

      clear-history = [ ];
      next-entry = [ "<Shift><Control>p" ];
      prev-entry = [ "<Shift><Control>o" ];
      private-mode-binding = [ ];
      toggle-menu = [ "<Super>v" ];
    };

    "org/gnome/shell/extensions/alphabetical-app-grid" = {
      folder-order-position = "alphabetical";
      logging-enabled = false;
      show-favourite-apps = false;
      sort-folder-contents = true;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
      transparency-mode = "FIXED";
    };
  };
}
