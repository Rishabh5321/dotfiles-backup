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
  sound.enable = true;

  # rtkit is optional but recommended
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;
  };
  hardware.pulseaudio.enable = false;
  # Enable Bluetooth service
  services.blueman.enable = true;

}