{
  config,
  lib,
  pkgs,
  wallpaper,
  username,
  ...
}:
let
  # https://github.com/flameshot-org/flameshot/issues/2848
  flameshot-gui = pkgs.writeShellScriptBin "flameshot-gui" "${pkgs.flameshot}/bin/flameshot gui --raw | wl-copy";
in
{

  home.file.".config/gtk-3.0/bookmarks".text = ''
    file:///home/nelson/source/personal
    file:///home/nelson/source
    file:///s3fs s3fs
  '';

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      clock-format = "12h";
      enable-hot-corners = false;
      show-battery-percentage = true;
      color-scheme = "prefer-dark";
    };

    "org/gnome/shell" = {
      favorite-apps = [
        "kitty.desktop"
        "org.gnome.Nautilus.desktop"
        "floorp.desktop"
        "code.desktop"
        "github-desktop"
        "bitwarden.desktop"
        "steam.desktop"
        "com.heroicgameslauncher.hgl.desktop"
        "net.lutris.Lutris.desktop"
        "cursor.desktop"
        "discord.desktop"
        "telegramdesktop.desktop"
        "plexmediaplayer.desktop"
      ];
    };

    "org/gnome/login-screen" = {
      banner-message-enable = true;
      banner-message-text = "Welcome to your system!";
      background = "/home/${username}/Pictures/Wallpapers/${wallpaper}";
    };

    "org/gnome/desktop/peripherals/touchpad" = {
      tap-to-click = true;
    };

    # settings mouse follows focus
    "org/gnome/desktop/wm/preferences" = {
      focus-mode = "sloppy";
    };

    # Use capslock as super key
    "org/gnome/desktop/input-sources" = {
      xkb-options = [
        "caps:super" # map capslock to windows/mac key
        "numpad:mac" # always enable numlock
        "f:XF86AudioRaiseVolume"
      ];
    };

    "org/gnome/desktop/notifications" = {
      show-in-lock-screen = false;
    };

    "org/gnome/desktop/sound" = {
      allow-volume-above-100-percent = true;
      event-sounds = false;
    };

    "org/gnome/desktop/wm/keybindings" = {
      toggle-message-tray = ["<Super>m"]; # Free up <Super>m
      close = [ "<Super>q" ];
      search = [ "<Super><Shift>Enter" ]; # change search keybind to super shift enter
      toggle-fullscreen = [ "<Super>f" ];
      switch-windows = [ "<Alt>Tab" ];
      switch-to-workspace-left = [ "<Control><Super>Left" ];
      switch-to-workspace-right = [ "<Control><Super>Right" ];
    };

    "org/gnome/mutter" = {
      overlay-key = "Super_R";
      edge-tiling = true;
      dynamic-workspaces = true;
    };

    "org/gnome/shell/keybindings" = {
      show-screenshot-ui = [ ]; # free up Print
      toggle-message-tray = [ "<Super>v" ];
      toggle-quick-settings = [ ]; # free up super-s
    };

    # map the mappings
    "org/gnome/settings-daemon/plugins/media-keys" = {
      next = [ "<Super>bracketright" ];
      play = [ "<Super>backslash" ];
      previous = [ "<Super>bracketleft" ]; 
      screenshot = [ ]; # free up for flameshot
      volume-down = [ "<Shift><Super>braceleft" ];
      volume-up = [ "<Shift><Super>braceright" ];

      custom-keybindings = [
        "/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/"
      ];
    };

    "org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0" = {
      binding = "Print";
      command = "${flameshot-gui}/bin/flameshot-gui";
      name = "flameshot screenshot";
    };

    "org/gnome/shell" = {
      disable-extension-version-validation = true;
      disable-user-extensions = false;
    };
  };
}