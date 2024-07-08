{ pkgs, lib, inputs, spicetify-nix, ... }:
{
  # Styling Options
  #stylix.targets.waybar.enable = false;
  #stylix.targets.rofi.enable = false;
  #stylix.targets.hyprland.enable = false;
  gtk = {
    iconTheme = {
      name = "Adwaita";
      package = pkgs.gnome.adwaita-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "Adwaita";
    platformTheme.name = "gtk3";
  };
}