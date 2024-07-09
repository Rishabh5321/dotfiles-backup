{ pkgs, config, lib, wallpaper, username, ... }:

{
  services.displayManager = {
    enable = true;
    sddm = {
      enable = true;
      wayland = {
        enable = true;
      };
      sugarCandyNix = {
        enable = true; # This set SDDM's theme to "sddm-sugar-candy-nix".
        settings = {
          # Set your configuration options here.
          # Here is a simple example:
          Background = lib.cleanSource ../../config/wallpapers/${wallpaper};
          ScreenWidth = 1920;
          ScreenHeight = 1080;
          FormPosition = "left";
          HaveFormBackground = false;
          PartialBlur = true;
          HourFormat = "h:m:s ap";
          #MainColor = "#${config.stylix.base16Scheme.base05}";
          AccentColor = "#${config.stylix.base16Scheme.base02}";
          #BackgroundColor = "#${config.stylix.base16Scheme.base09}";
          # ...
        };
      };
      defaultSession = "Hyprland";
      #theme = "${import ./pkgs/sddm-astronaut-theme.nix { inherit pkgs; }}";
      autoNumlock = true;
    };
  };
  #services.displayManager.defaultSession = "Hyprland";
  services.libinput.enable = true;

  environment.systemPackages =
let
    sugar = pkgs.callPackage ./pkgs/sddm-sugar-dark.nix {};
    tokyo-night = pkgs.libsForQt5.callPackage ./pkgs/sddm-tokyo-night.nix {};
    firewatch-dark = pkgs.callPackage ./pkgs/sddm-firewatch.nix {};
    astronaut = pkgs.callPackage ./pkgs/sddm-astronaut-theme.nix {};
in [ 
    sugar.sddm-sugar-dark # Name: sugar-dark
    tokyo-night # Name: tokyo-night-sddm
    firewatch-dark.sddm-firewatch # Name sddm-firewatch
    astronaut #name astronaut
    pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
