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
  # Bluetooth Support
  hardware.bluetooth.enable = true;
  #hardware.bluetooth.powerOnBoot = true;
  #services.blueman.enable = true;
}
