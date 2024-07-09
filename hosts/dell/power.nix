{ config, pkgs, username, ... }:

{
  services.displayManager.sddm = {
    enable = true;
    autoLogin = {
      enable = true;
      user = "rishabh";
    };
  };
#  services.xserver.displayManager.gdm= {
#    enable = true;
#    autoSuspend = false;
#  };

}