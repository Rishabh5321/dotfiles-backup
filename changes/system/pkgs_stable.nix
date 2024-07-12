{
  config,
  pkgs,
  host,
  inputs,
  username,
  options,
  ...
}: {
  environment.systemPackages = let
    cursor = pkgs.callPackage ./pkgs/cursor.nix {};
  in
    with pkgs; [
      alacritty
      android-tools
      bitwarden-desktop
      bottles
      brave
      cava
      cursor
      cliphist
      distrobox
      fast-cli
      fastfetch
      ffmpeg
      firefox
      floorp
      gh
      gnome.gnome-disk-utility
      gnome.gnome-system-monitor
      gnome.nautilus
      google-chrome
      jellyfin-media-player
      kodi-wayland
      lazydocker
      libreoffice
      micro
      onlyoffice-bin_latest
      pfetch-rs
      peaclock
      plex-media-player
      #prismlauncher
      qbittorrent
      ranger
      spotdl
      speedtest-cli
      #spicetify-cli
      stremio
      telegram-desktop
      tldr
      uwufetch
      vlc
      wayland-pipewire-idle-inhibit
      #wezterm
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
      powerline
      material-icons
    ];
  };
}
