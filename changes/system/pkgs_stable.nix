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
      distrobox
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
      google-chrome
      heroic
      inputs.nix-software-center.packages.${system}.nix-software-center
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
      wayland-pipewire-idle-inhibit
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
