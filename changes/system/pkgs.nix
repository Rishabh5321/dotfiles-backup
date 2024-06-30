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
      atuin
      bottles
      brave
      clipman
      cursor
      fast-cli
      fastfetch
      ffmpeg-full
      firefox
      floorp
      gh
      github-desktop
      gnome.gnome-disk-utility
      gnome.gnome-system-monitor
      gnome.nautilus
      hypridle
      heroic
      jellyfin-media-player
      kodi
      libreoffice
      lutris
      micro
      music-player
      nvtopPackages.full
      onlyoffice-bin
      peaclock
      plex-media-player
      qbittorrent
      ranger
      #spotdl
      speedtest-cli
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
    programs.kdeconnect = {
      enable = true;
      package = pkgs.kdePackages.kdeconnect-kde;
      #indicator = true;
    };
}
