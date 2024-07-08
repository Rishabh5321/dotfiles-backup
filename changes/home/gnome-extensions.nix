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
      { package = pkgs.gnomeExtensions.ddterm; }
      { package = pkgs.gnomeExtensions.just-perfection; }
      { package = pkgs.gnomeExtensions.gsconnect; }
      { package = pkgs.gnomeExtensions.pip-on-top; }
      { package = pkgs.gnomeExtensions.dash-to-dock; }
      { package = pkgs.gnomeExtensions.alphabetical-app-grid; }
      { package = pkgs.gnomeExtensions.blur-my-shell; }
      { package = pkgs.gnomeExtensions.impatience; }
      { package = pkgs.gnomeExtensions.system-monitor; }
      #{ package = pkgs.gnomeExtensions.github-actions; }
      # "Play lofi music on your Gnome desktop with just a click!"
      #   https://github.com/eucaue/gnome-shell-extension-quick-lofi
    ];
  };

  dconf.settings = {

    # https://github.com/rafaelmardojai/blanket
    #   "Improve focus and increase your productivity by listening to different
    #   sounds. Or allows you to fall asleep in a noisy environment"
    "com/rafaelmardojai/Blanket" = {
      autostart = false;
      background-playback = true;
      start-paused = false;
    };

    "org/gnome/shell/extensions/just-perfection" = {
      dash = false;
      search = true;
      startup-status = 0; # disable the overview popup thing
      theme = false;
      window-maximized-on-create = true;
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
      toggle-menu = [ "<Shift><Control>i" ];
    };

    "org/gnome/shell/extensions/quick-lofi" = {
      volume = 75;
      radios = [
        # somafm
        "SomaFM DEF CON - http://somafm.com/defcon130.pls"
        "SomaFM Doomed - http://somafm.com/doomed130.pls"
        "SomaFM Drone Zone - http://somafm.com/dronezone130.pls"
        "SomaFM Groove Salad - http://somafm.com/groovesalad130.pls"
        "SomaFM SF 10-33 - http://somafm.com/sf1033130.pls"
        "SomaFM Space Station - http://somafm.com/spacestation130.pls"
        "SomaFM Synphaera - http://somafm.com/synphaera130.pls"
        "SomaFM Vaporwaves - http://somafm.com/vaporwaves130.pls"

        # "radio"
        "KALW - https://kalw-live.streamguys1.com/kalw.aac"
        "KEXP - https://kexp-mp3-128.streamguys1.com/kexp128.mp3"

        # rekt.network
        "rekt: chillsynth - http://stream.rekt.network/chillsynth.ogg"
        "rekt: darksynth - http://stream.rekt.network/darksynth.ogg"
        "rekt: datawave - http://stream.rekt.network/datawave.ogg"
        "rekt: ebsm - http://stream.rekt.network/ebsm.ogg"
        "rekt: horrorsynth - http://stream.rekt.network/horrorsynth.ogg"
        "rekt: nightride - http://stream.rekt.network/nightride.ogg"
        "rekt: rekt - http://stream.rekt.network/rekt.ogg"
        "rekt: rektory - http://stream.rekt.network/rektory.ogg"
        "rekt: spacesynth - http://stream.rekt.network/spacesynth.ogg"

        "[emergency slow internet] - http://somafm.com/defcon32.pls"
      ];
    };

    "org/gnome/shell/extensions/swsnr-picture-of-the-day" = {
      selected-source = "bing";
    };

    "org/gnome/shell/extensions/appindicator" = {
      icon-brightness = -0.1;
      icon-opacity = 255;
      icon-saturation = 0.8;
      icon-size = 20;
      tray-pos = "right";
    };

    "org/gnome/shell/extensions/git" = {
    };

    "org/gnome/shell/extensions/caffeine" = {
      indicator-position = -1;
      indicator-position-index = -1;
      screen-blank = "never";
      show-indicator = "only-active";
      show-notifications = false;
      toggle-shortcut = [ "<Super>c" ];
    };

    "org/gnome/shell/extensions/github-notifications" = {
      handle = "NelsonJeppesen";
      hide-widget = true;
      refresh-interval = 61;
    };

    "org/gnome/shell/extensions/dash-to-dock" = {
    };


    "org/gnome/shell/extensions/gsconnect" = {
      autostart = true;
      show-indicator = true;
      use-gnome-shell-notifications = true;
    };

    "org/gnome/shell/extensions/blur-my-shell" = {
      brightness = 0.8;
      sigma = 30;
      noise = 0.1;
      panel-blur = true;
      dash-blur = true;
      overview-blur = true;
    };

    "org/gnome/shell/extensions/impatience" = {
      speed-factor = 0.5;
    };

    #"org/gnome/shell/extensions/ddterm" = {
    #  keyboard-activation-shortcut = "<Super>t";
    #};


    #"org/gnome/shell/extensions/pano" = {
    #  history-length = 500;
    #  keep-search-entry = false;
    #  open-links-in-browser = false;
    #  play-audio-on-copy = false;
    #  send-notification-on-copy = false;
    #  show-indicator = false;
    #  window-position = lib.hm.gvariant.mkUint32 (1); # right side of the screen
    #};

    #"org/gnome/shell/extensions/pano/text-item" = {
    #  body-bg-color = "rgb(153,193,241)";
    #};

  };
}