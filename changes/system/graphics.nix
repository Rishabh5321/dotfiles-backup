{ config, pkgs, ... }:
{
  # OpenGL
  hardware.opengl = {
    enable = true;
    #driSupport = true;
    driSupport32Bit = true;
  };
}
