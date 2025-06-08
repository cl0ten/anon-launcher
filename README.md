![Anyone Browser Launcher](https://raw.githubusercontent.com/cl0ten/anon-launcher/refs/heads/main/anon/icon.ico)
# Anon Launcher
Anon Launcher for Firefox (& Chrome) on Windows

## Dependencies

* This setup only works on Windows systems (Tested with Firefox but not Chrome yet, on Windows 11 PowerShell 7)
* Firefox or Chrome must already be installed on the system (If firefox can't be found the tool will look for Chrome)

### Disclaimer
It's recommended to install and use Firefox with this setup, which comes with enhanced privacy settings for the user profile.

Chrome is just a fallback option for simple access and demo purposes. It is not designed for enhanced security or privacy, just for easy access to the network.

## Demo Video of POC
See: https://x.com/cl0ten/status/1908302067946356865

######################

## 1. Download

You'll find the full package as a ZIP archive by clicking the "Code" button on [this page](https://github.com/cl0ten/anon-launcher) and select "Download ZIP".

Or use this direct link: https://github.com/cl0ten/anon-launcher/archive/refs/heads/main.zip

## 2. Install

a. Extract the contents of the zip file to a folder of your choice.

b. Run the setup script:

```
Run_Setup.bat
```
This will download "anon.exe", "anon-gencert.exe" and generate shortcuts for the browser.

## 3. Usage

After installation, double click the "Anon <BrowserName> Launcher" link to start Firefox and "anon.exe" with preconfigured proxy settings (127.0.0.1:9050).

```
Anon <BrowserName> Launcher.lnk
```

######################

## Browser leak test sites

* https://check.en.anyone.io
* https://browserleaks.com
* https://arkenfox.github.io/TZP/tzp.html

## Troubleshooting

* Make sure anon.exe is running and isn't blocked by your firewall or antivirus.
* Investigate the anon.exe logs visible in the miminized anon.exe proxy window.
* Check if the "browser-with-proxy.lnk" has the right path to Firefox executable and proxy settings configured in the properties target path.

## File flow overview

```
Run_Setup.bat
  └── create_shortcut.bat
        └── create_shortcut.ps1
              └── Generates shortcuts and downloads Anyone tools

Anon Launcher.lnk
  └── start_anon_browser.bat
        ├── Launches anon.exe
        └── Launches browser-with-proxy.lnk
              └── Opens Firefox with proxy settings
```

## File structure

### Important files

* README.md
* Run_Setup.bat
* Run_Cleanup.bat
* anon/icon.ico
* anon/create_shortcut.bat
* anon/create_shortcut.ps1


### Generated files and folders to delete before starting a fresh setup

* Anon <BrowserName> Launcher.lnk
* anon/anon_profile/
* anon/anon.exe
* anon/anon-gencert.exe
* anon/browser-with-proxy.lnk
* anon/start_anon_browser.bat

### Cleanup
You can also use the cleanup script to delete all the unwanted files automatically
```
Run_Cleanup.bat
```
Make sure the customised Firefox window and anon.exe is closed before running the Cleanup (files will not be cleaned when they are being used).

## Custom user.js settings for Firefox
Adjust these settings as you see fit and add more if needed, there is no perfect solution (use Linux for better security, privacy and performance)

```js
user_pref("app.normandy.api_url", "");
user_pref("app.normandy.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("breakpad.reportURL", "");
user_pref("browser.aboutConfig.showWarning", false);
user_pref("browser.cache.disk.enable", false);
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.discovery.enabled", false);
user_pref("browser.download.manager.addToRecentDocs", false);
user_pref("browser.download.manager.scanWhenDone", true);
user_pref("browser.download.start_downloads_in_tmp_dir", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.helperApps.deleteTempFileOnExit", true);
user_pref("browser.link.open_newwindow.restriction", 0);
user_pref("browser.newtabpage.activity-stream.default.sites", "");
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.newtabpage.activity-stream.feeds.telemetry", false);
user_pref("browser.newtabpage.activity-stream.showSponsored", false);
user_pref("browser.newtabpage.activity-stream.showSponsoredTopSites", false);
user_pref("browser.newtabpage.activity-stream.telemetry", false);
user_pref("browser.newtabpage.enabled", false);
user_pref("browser.pagethumbnails.capturing_disabled", true);
user_pref("browser.places.speculativeConnect.enabled", false);
user_pref("browser.privatebrowsing.autostart", true);
user_pref("browser.privatebrowsing.forceMediaMemoryCache", true);
user_pref("browser.region.network.url", "");
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
user_pref("browser.safebrowsing.allowOverride", false);
user_pref("browser.safebrowsing.blockedURIs.enabled", false);
user_pref("browser.safebrowsing.downloads.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.block_potentially_unwanted", false);
user_pref("browser.safebrowsing.downloads.remote.block_uncommon", false);
user_pref("browser.safebrowsing.downloads.remote.enabled", false);
user_pref("browser.safebrowsing.downloads.remote.url", "");
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.provider.google.gethashURL", "");
user_pref("browser.safebrowsing.provider.google.updateURL", "");
user_pref("browser.safebrowsing.provider.google4.dataSharingURL", "");
user_pref("browser.safebrowsing.provider.google4.gethashURL", "");
user_pref("browser.safebrowsing.provider.google4.updateURL", "");
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.defaultenginename", "DuckDuckGo");
user_pref("browser.search.hiddenOneOffs", "");
user_pref("browser.search.openintab", true);
user_pref("browser.search.region", "US");
user_pref("browser.search.reset.enabled", false);
user_pref("browser.search.selectedEngine", "DuckDuckGo");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.sessionstore.privacy_level", 2);
user_pref("browser.sessionstore.resume_from_crash", false);
//user_pref("browser.shell.checkDefaultBrowser", false);
user_pref("browser.shell.shortcutFavicons", false);
user_pref("browser.startup.homepage", "about:home");
user_pref("browser.startup.page",  1);
user_pref("browser.tabs.crashReporting.sendReport", false);
user_pref("browser.toolbars.bookmarks.visibility", "always");
user_pref("browser.toolbars.bookmarks.visibility", "always");
user_pref("browser.urlbar.addons.featureGate", false);
user_pref("browser.urlbar.mdn.featureGate", false);
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
user_pref("browser.urlbar.quicksuggest.enabled", false);
user_pref("browser.urlbar.speculativeConnect.enabled", false);
user_pref("browser.urlbar.suggest.quicksuggest.nonsponsored", false);
user_pref("browser.urlbar.suggest.quicksuggest.sponsored", false);
user_pref("browser.urlbar.suggest.searches", false);
user_pref("browser.urlbar.trending.featureGate", false);
user_pref("browser.urlbar.yelp.featureGate", false);
user_pref("browser.xul.error_pages.expert_bad_cert", true);
user_pref("captivedetect.canonicalURL", "");
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("dom.popup_allowed_events", "click dblclick mousedown pointerdown");
//user_pref("dom.security.https_only_mode", true);
//user_pref("dom.security.https_only_mode_send_http_background_request", false);
user_pref("extensions.enabledScopes", 5);
user_pref("extensions.formautofill.addresses.enabled", false);
user_pref("extensions.formautofill.creditCards.enabled", false);
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.htmlaboutaddons.recommendations.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.postDownloadThirdPartyPrompt", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("general.useragent.locale", "en-US");
user_pref("general.warnOnAboutConfig", false);
user_pref("geo.enabled", false);
user_pref("geo.provider.ms-windows-location", false);
user_pref("geo.provider.network.url", "");
user_pref("geo.wifi.uri", "");
user_pref("identity.fxaccounts.enabled", false);
user_pref("identity.fxaccounts.remote.login.uri", "");
user_pref("intl.accept_languages", "en-US, en");
user_pref("intl.locale.requested", "en-US");
user_pref("javascript.use_us_english_locale", true);
user_pref("media.eme.enabled", false);
user_pref("media.memory_cache_max_size", 65536);
user_pref("media.peerconnection.enabled", false);
user_pref("media.peerconnection.ice.default_address_only", true);
user_pref("media.peerconnection.ice.no_host", true);
user_pref("media.peerconnection.ice.proxy_only_if_behind_proxy", true);
user_pref("network.IDN_show_punycode", true);
user_pref("network.auth.subresource-http-auth-allow", 1);
user_pref("network.captive-portal-service.enabled", false);
user_pref("network.connectivity-service.enabled", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("network.cookie.lifetimePolicy", 2);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.dns.disablePrefetchFromHTTPS", true);
user_pref("network.file.disable_unc_paths", true);
user_pref("network.gio.supported-protocols", "");
user_pref("network.http.referer.XOriginTrimmingPolicy", 2);
user_pref("network.http.sendRefererHeader", 0);
user_pref("network.http.speculative-parallel-limit", 0);
user_pref("network.predictor.enabled", false);
user_pref("network.prefetch-next", false);
user_pref("network.proxy.no_proxies_on", "");
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.proxy.type", 1);
user_pref("network.trr.custom_uri", "");
user_pref("network.trr.mode", 5);
user_pref("network.trr.uri", "");
user_pref("pdfjs.enableScripting", false);
user_pref("permissions.default.camera", 0);
user_pref("permissions.default.desktop-notification", 0);
user_pref("permissions.default.geo", 0);
user_pref("permissions.default.microphone", 0);
user_pref("permissions.manager.defaultsUrl", "");
user_pref("places.history.enabled", false);
user_pref("plugin.state.flash", 0);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.offlineApps", true);
user_pref("privacy.clearOnShutdown_v2.cookiesAndStorage", true);
user_pref("privacy.firstparty.isolate", true);
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.block_mozAddonManager", true);
user_pref("privacy.resistFingerprinting.letterboxing", false);
user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("privacy.sanitize.sanitizeOnShutdown", true);
user_pref("privacy.sanitize.timeSpan", 0);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.userContext.enabled", true);
user_pref("privacy.userContext.ui.enabled", true);
user_pref("privacy.window.maxInnerHeight", 900);
user_pref("privacy.window.maxInnerWidth", 1600);
user_pref("security.OCSP.require", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.csp.enable", true);
user_pref("security.pki.crlite_mode", 2);
user_pref("security.remote_settings.crlite_filters.enabled", true);
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.tls.version.max", 4);
user_pref("security.ssl.tls.version.min", 3);
user_pref("security.tls.enable_0rtt_data", false);
user_pref("signon.autofillForms", false);
user_pref("signon.formlessCapture.enabled", false);
user_pref("signon.rememberSignons", false);
user_pref("toolkit.coverage.endpoint.base.", "");
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.telemetry.archive.enabled", false);
user_pref("toolkit.telemetry.bhrPing.enabled", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.coverage.opt-out", true);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.firstShutdownPing.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.server", "data:,");
user_pref("toolkit.telemetry.shutdownPingSender.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.updatePing.enabled", false);
user_pref("toolkit.winRegisterApplicationRestart", false);
user_pref("webgl.disabled", true);
```

## Resources

* https://docs.anyone.io
* https://github.com/anyone-protocol
* https://github.com/arkenfox/user.js
