{
  inputs,
  pkgs,
  ...
}: 
{
  services.wayland-pipewire-idle-inhibit = {
    enable = true;
    package = pkgs.wayland-pipewire-idle-inhibit;
    systemdTarget = "hyprland-session.target";
    settings = {
      verbosity = "INFO";
      media_minimum_duration = 10;
      idle_inhibitor = "wayland";
      sink_whitelist = [
        {name = "Built-in Audio Analog Stereo";}
      ];
      node_blacklist = [
        {app_name = "[Ss]potify";}
      ];
    };
  };
}