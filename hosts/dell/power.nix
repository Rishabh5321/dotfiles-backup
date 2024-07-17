{
  config,
  pkgs,
  username,
  ...
}:
{
  services.xserver.displayManager.gdm = {
    enable = true;
    autoSuspend = false;
  };

  services.logind.lidSwitch = "ignore";

  services.logind.lidSwitchDocked = "ignore";
}
