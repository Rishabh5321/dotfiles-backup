{
  pkgs,
  config,
  ...
}: {
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
}
