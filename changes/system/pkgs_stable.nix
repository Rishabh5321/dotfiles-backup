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
  environment.systemPackages =
    let
      cursor = pkgs.callPackage ./pkgs/cursor.nix { };
    in
    with pkgs;
    [
      alacritty
      android-tools
      bitwarden-desktop
      bottles
      brave
      cava
      cursor
      cliphist
      distrobox
      filezilla
      fast-cli
      fastfetch
      ffmpeg
      firefox
      floorp
      figlet
      gh
      hyprlock
      hyprshot
      gnome.gnome-disk-utility
      gnome.gnome-system-monitor
      gnome.nautilus
      google-chrome
      jellyfin-media-player
      #inputs.wezterm.packages.${pkgs.system}.default
      kodi-wayland
      lazycli
      lazydocker
      libreoffice
      micro
      obsidian
      onlyoffice-bin_latest
      pfetch-rs
      peaclock
      plex-media-player
      polkit_gnome
      #prismlauncher
      qbittorrent
      ranger
      spicetify-cli
      spotdl
      speedtest-cli
      #spicetify-cli
      stremio
      telegram-desktop
      tldr
      uwufetch
      vlc
      wayland-pipewire-idle-inhibit
      wlroots
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
