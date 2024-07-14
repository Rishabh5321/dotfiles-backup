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
    user_pref("layers.acceleration.force-enabled", true);
    user_pref("gfx.webrender.all", true);
    user_pref("svg.context-properties.content.enabled", true);
    user_pref("browser.cache.disk.enable", false);
    user_pref("browser.cache.memory.capacity", 524288);
    user_pref("browser.sessionstore.interval", 15000000);
    user_pref("browser.helperApps.deleteTempFileOnExit", true);
    user_pref("browser.uitour.enabled", false);

    /*** STARTUP ***/

    /* set startup page
     * 0=blank, 1=home, 2=last visited page, 3=resume previous session*/
    //user_pref("browser.startup.page", 1);
    /* set HOME+NEWWINDOW page
     * about:home=Firefox Home, custom URL, about:blank*/
    //user_pref("browser.startup.homepage", "about:home");
    /* disable sponsored content on Firefox Home (Activity Stream)
     * [SETTING] Home>Firefox Home Content ***/
    user_pref("browser.newtabpage.activity-stream.showSponsored", false); // [FF58+] Pocket > Sponsored Stories
    user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false); // [FF83+] Sponsored shortcuts
    /* clear default topsites
     * [NOTE] This does not block you from adding your own ***/
    user_pref("browser.newtabpage.activity-stream.default.sites", "");



    /*** QUIETER FOX ***/

    /* disable recommendation pane in about:addons (uses Google Analytics) ***/
    user_pref("extensions.getAddons.showPane", false); // [HIDDEN PREF]
    /* recommendations in about:addons' Extensions and Themes panes [FF68+] ***/
    user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
    /* personalized Extension Recommendations in about:addons and AMO [FF65+]
     * https://support.mozilla.org/kb/personalized-extension-recommendations ***/
    user_pref("browser.discovery.enabled", false);

    /** TELEMETRY ***/

    /* disable new data submission */
    user_pref("datareporting.policy.dataSubmissionEnabled", false);
    /* disable Health Reports */
    user_pref("datareporting.healthreport.uploadEnabled", false);
    /* 0332: disable telemetry */
    user_pref("toolkit.telemetry.unified", false);
    user_pref("toolkit.telemetry.enabled", false);
    user_pref("toolkit.telemetry.server", "data:,");
    user_pref("toolkit.telemetry.archive.enabled", false);
    user_pref("toolkit.telemetry.newProfilePing.enabled", false);
    user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
    user_pref("toolkit.telemetry.updatePing.enabled", false);
    user_pref("toolkit.telemetry.bhrPing.enabled", false);
    user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
    /* disable Telemetry Coverage */
    user_pref("toolkit.telemetry.coverage.opt-out", true); // [HIDDEN PREF]
    user_pref("toolkit.coverage.opt-out", true); // [FF64+] [HIDDEN PREF]
    user_pref("toolkit.coverage.endpoint.base", "");
    /* disable PingCentre telemetry (used in several System Add-ons) [FF57+] */
    user_pref("browser.ping-centre.telemetry", false);
    /* disable Firefox Home (Activity Stream) telemetry ***/
    user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
    user_pref("browser.newtabpage.activity-stream.telemetry", false);
    user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
    user_pref("toolkit.telemetry.shutdownPingSender.enabledFirstsession", false);
    user_pref("browser.vpn_promo.enabled", false);

  '';
  home.file.".mozilla/firefox/x1px2170.default/chrome/userChrome.css".text = ''
 /* 
┌─┐┬┌┬┐┌─┐┬  ┌─┐
└─┐││││├─┘│  ├┤ 
└─┘┴┴ ┴┴  ┴─┘└─┘
┌─┐┌─┐─┐ ┬      
├┤ │ │┌┴┬┘      
└  └─┘┴ └─

by Miguel Avila

*/

/*
 
┌─┐┌─┐┌┐┌┌─┐┬┌─┐┬ ┬┬─┐┌─┐┌┬┐┬┌─┐┌┐┌
│  │ ││││├┤ ││ ┬│ │├┬┘├─┤ │ ││ ││││
└─┘└─┘┘└┘└  ┴└─┘└─┘┴└─┴ ┴ ┴ ┴└─┘┘└┘

*/

:root {
  --sfwindow: #19171a;
  --sfsecondary: #201e21;
}

/* Urlbar View */

/*─────────────────────────────*/
/* Comment this section if you */
/* want to show the URL Bar    */
/*─────────────────────────────*/

.urlbarView {
  display: none !important;
}

/*─────────────────────────────*/

/* 
┌─┐┌─┐┬  ┌─┐┬─┐┌─┐
│  │ ││  │ │├┬┘└─┐
└─┘└─┘┴─┘└─┘┴└─└─┘ 
*/

/* Tabs colors  */
#tabbrowser-tabs:not([movingtab])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab
  > .tab-stack
  > .tab-background[multiselected='true'],
#tabbrowser-tabs:not([movingtab])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab
  > .tab-stack
  > .tab-background[selected='true'] {
  background-image: none !important;
  background-color: var(--toolbar-bgcolor) !important;
}

/* Inactive tabs color */
#navigator-toolbox {
  background-color: var(--sfwindow) !important;
}

/* Window colors  */
:root {
  --toolbar-bgcolor: var(--sfsecondary) !important;
  --tabs-border-color: var(--sfsecondary) !important;
  --lwt-sidebar-background-color: var(--sfwindow) !important;
  --lwt-toolbar-field-focus: var(--sfsecondary) !important;
}

/* Sidebar color  */
#sidebar-box,
.sidebar-placesTree {
  background-color: var(--sfwindow) !important;
}

/* 

┌┬┐┌─┐┬  ┌─┐┌┬┐┌─┐            
 ││├┤ │  ├┤  │ ├┤             
─┴┘└─┘┴─┘└─┘ ┴ └─┘            
┌─┐┌─┐┌┬┐┌─┐┌─┐┌┐┌┌─┐┌┐┌┌┬┐┌─┐
│  │ ││││├─┘│ ││││├┤ │││ │ └─┐
└─┘└─┘┴ ┴┴  └─┘┘└┘└─┘┘└┘ ┴ └─┘

*/

/* Tabs elements  */
.tab-close-button {
  display: none;
}

.tabbrowser-tab:not([pinned]) .tab-icon-image {
  display: none !important;
}

#nav-bar:not([tabs-hidden='true']) {
  box-shadow: none;
}

#tabbrowser-tabs[haspinnedtabs]:not([positionpinnedtabs])
  > #tabbrowser-arrowscrollbox
  > .tabbrowser-tab[first-visible-unpinned-tab] {
  margin-inline-start: 0 !important;
}

:root {
  --toolbarbutton-border-radius: 0 !important;
  --tab-border-radius: 0 !important;
  --tab-block-margin: 0 !important;
}

.tab-background {
  border-right: 0px solid rgba(0, 0, 0, 0) !important;
  margin-left: -4px !important;
}

.tabbrowser-tab:is([visuallyselected='true'], [multiselected])
  > .tab-stack
  > .tab-background {
  box-shadow: none !important;
}

.tabbrowser-tab[last-visible-tab='true'] {
  padding-inline-end: 0 !important;
}

#tabs-newtab-button {
  padding-left: 0 !important;
}

/* Url Bar  */
#urlbar-input-container {
  background-color: var(--sfsecondary) !important;
  border: 1px solid rgba(0, 0, 0, 0) !important;
}

#urlbar-container {
  margin-left: 0 !important;
}

#urlbar[focused='true'] > #urlbar-background {
  box-shadow: none !important;
}

#navigator-toolbox {
  border: none !important;
}

/* Bookmarks bar  */
.bookmark-item .toolbarbutton-icon {
  display: none;
}
toolbarbutton.bookmark-item:not(.subviewbutton) {
  min-width: 1.6em;
}

/* Toolbar  */
#tracking-protection-icon-container,
#urlbar-zoom-button,
#star-button-box,
#pageActionButton,
#pageActionSeparator,
#tabs-newtab-button,
#back-button,
#PanelUI-button,
#forward-button,
.tab-secondary-label {
  display: none !important;
}

.urlbarView-url {
  color: #dedede !important;
}

/* Disable elements  */
#context-navigation,
#context-savepage,
#context-pocket,
#context-sendpagetodevice,
#context-selectall,
#context-viewsource,
#context-inspect-a11y,
#context-sendlinktodevice,
#context-openlinkinusercontext-menu,
#context-bookmarklink,
#context-savelink,
#context-savelinktopocket,
#context-sendlinktodevice,
#context-searchselect,
#context-sendimage,
#context-print-selection {
  display: none !important;
}

#context_bookmarkTab,
#context_moveTabOptions,
#context_sendTabToDevice,
#context_reopenInContainer,
#context_selectAllTabs,
#context_closeTabOptions {
  display: none !important;
}
  '';
  home.file.".mozilla/firefox/x1px2170.default/chrome/userContent.css".text = ''
    /* 
┌─┐┬┌┬┐┌─┐┬  ┌─┐
└─┐││││├─┘│  ├┤ 
└─┘┴┴ ┴┴  ┴─┘└─┘
┌─┐┌─┐─┐ ┬      
├┤ │ │┌┴┬┘      
└  └─┘┴ └─

by Miguel Avila

*/

:root {
  scrollbar-width: none !important;
}

@-moz-document url(about:privatebrowsing) {
  :root {
    scrollbar-width: none !important;
  }
}
  '';
}
