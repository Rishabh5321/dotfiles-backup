{ pkgs, config, ... }:
{
  #services.desktopManager.plasma6.enable = true;
  #  services.xserver = {
  #    enable = true;
  #    displayManager.gdm.enable = true;
  #    desktopManager.gnome.enable = true;
  #  };

  #  environment.systemPackages = with pkgs; [
  #    gnome.gnome-tweaks
  #    gnome.gnome-shell-extensions
  #  ];
  #
  /*
    services.xserver = {
      enable = true;
      libinput.enable = true;
      displayManager.lightdm.enable = true;
      desktopManager.xfce.enable = true;
      displayManager.defaultSession = "hyprland";
      windowManager.i3 = {
         enable = true;
        };
    };
  */

  services.xserver = {
    enable = true;
    desktopManager.gnome.enable = true;
    displayManager.gdm.enable = true;
    xkb.layout = "us";
  };
  services.libinput = {
    touchpad.tapping = true;
  };
  services.gnome.gnome-initial-setup.enable = false;
  services.gnome.sushi.enable = false;
  services.gnome.rygel.enable = false;
  services.gnome.games.enable = false;

  # Remove gnome tools I don't use
  environment.gnome.excludePackages = with pkgs.gnome; [
    gnome-backgrounds
    gnome-maps
    gnome-music
    pkgs.gnome-tour
    pkgs.gnome-user-docs
    pkgs.gnome-video-effects
  ];

  environment.systemPackages = [
    pkgs.playerctl # gsconnect play/pause command
    pkgs.pamixer # gcsconnect volume control
    pkgs.gnome.gnome-tweaks
    pkgs.gnome.dconf-editor
    #pkgs.gnomeExtensions.vitals
    pkgs.gnomeExtensions.forge
  ];
}
