{
  pkgs,
  config,
  lib,
  ...
}:
{
  # Text Source Files
  home.file.".mozilla/firefox/profiles.ini".text = ''
    [Profile0]
    Name=x1px2170.default
    IsRelative=1
    Path=x1px2170.default
    Default=1

    [General]
    StartWithLastProfile=1
    Version=2
  '';
  home.file.".mozilla/firefox/x1px2170.default/user.js".text = ''
    user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);
    user_pref("browser.cache.disk.enable", false);
    user_pref("browser.cache.memory.capacity", 524288);
    user_pref("browser.sessionstore.interval", 15000000);
    user_pref("accessibility.force_disabled", 1);
    user_pref("browser.helperApps.deleteTempFileOnExit", true);
    user_pref("browser.uitour.enabled", false);

  '';
  home.file.".mozilla/firefox/x1px2170.default/chrome/userChrome.css".text = '''';
}
