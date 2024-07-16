{ username, ... }:
{

  services = {
    syncthing = {
      enable = true;
      user = "$username";
      dataDir = "/home/$username/"; # Default folder for new synced folders
      configDir = "/home/$username/Documents/.config/syncthing"; # Folder for Syncthing's settings and keys
    };
  };
}
