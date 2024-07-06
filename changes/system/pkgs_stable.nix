{
  config,
  pkgs,
  host,
  inputs,
  username,
  options,
  ...
}:
{
    environment.systemPackages = let
      cursor = pkgs.callPackage ./pkgs/cursor.nix {};
    in with pkgs;
    [
      alacritty
      android-tools
      bitwarden-desktop
      bottles
      brave
      cursor
      cliphist
      fast-cli
      fastfetch
      ffmpeg-full
      firefox
      gh
      github-desktop
      gnome.gnome-disk-utility
      gnome.gnome-system-monitor
      gnome.nautilus
      google-chrome
      heroic
      jellyfin-media-player
      kodi-wayland
      libreoffice
      lutris
      joplin-desktop
      micro
      nvtopPackages.full
      onlyoffice-bin_latest
      peaclock
      plex-media-player
      qbittorrent
      ranger
      rquickshare
      spotdl
      speedtest-cli
      #spicetify-cli
      stremio
      telegram-desktop
      tldr
      uwufetch
      vlc
      vscode
      xfce.xfce4-pulseaudio-plugin
      zinit
      zsh
      zsh-powerlevel10k

      #server
      #plex
    ];
    #services.plex.enable = true;
    #services.hypridle.enable = true;

  fonts = {
    packages = with pkgs; [
      noto-fonts-emoji
      noto-fonts-cjk
      font-awesome
      symbola
      material-icons
    ];
  };
}
