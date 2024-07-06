{
  config,
  pkgs,
  host,
  username,
  options,
  wallpaper,
  inputs,
  ...
}:
{
  environment.systemPackages = [      
    pkgs.cockpit
  ];

  # Cockpit
  services.cockpit = {
    enable = true;
    port = 9090;
    settings = {
      WebService = {
        AllowUnencrypted = true;
      };
    };
  };
 }