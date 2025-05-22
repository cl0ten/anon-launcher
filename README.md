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

After installation, double click the "Anon Launcher" link to start Firefox and "anon.exe" with preconfigured proxy settings (127.0.0.1:9050).

```
Anon Launcher.lnk
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
* anon/create_shortcut.bat
* anon/create_shortcut.ps1

### Generated files and folders to delete before starting a fresh setup

* Anon Launcher.lnk
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
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.download.manager.scanWhenDone", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("browser.formfill.enable", false);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("browser.privatebrowsing.autostart", true);
user_pref("browser.region.network.url", "");
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.defaultenginename", "DuckDuckGo");
user_pref("browser.search.hiddenOneOffs", "Google,Bing,Yahoo,Amazon.com,eBay,Wikipedia (en)");
user_pref("browser.search.openintab", true);
user_pref("browser.search.region", "US");
user_pref("browser.search.reset.enabled", false);
user_pref("browser.search.selectedEngine", "DuckDuckGo");
user_pref("browser.search.suggest.enabled", false);
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.pocket.enabled", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("general.useragent.locale", "en-US");
user_pref("general.warnOnAboutConfig", false);
user_pref("geo.enabled", false);
user_pref("geo.provider.ms-windows-location", disabled);
user_pref("geo.provider.network.url", "");
user_pref("geo.wifi.uri", "");
user_pref("identity.fxaccounts.enabled", false);
user_pref("identity.fxaccounts.remote.login.uri", "");
user_pref("intl.accept_languages", "en-US, en");
user_pref("media.eme.enabled", false);
user_pref("media.peerconnection.enabled", false);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("network.cookie.lifetimePolicy", 2);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.http.sendRefererHeader", 0);
user_pref("network.prefetch-next", false);
user_pref("network.proxy.no_proxies_on", "");
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.proxy.type", 1);
user_pref("network.trr.custom_uri", "");
user_pref("network.trr.mode", 5);
user_pref("network.trr.uri", "");
user_pref("permissions.default.camera", 0);
user_pref("permissions.default.desktop-notification", 0);
user_pref("permissions.default.geo", 0);
user_pref("permissions.default.microphone", 0);
user_pref("places.history.enabled", false);
user_pref("plugin.state.flash", 0);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.firstparty.isolate", true);
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.csp.enable", true);
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.ssl.tls.version.max", 4);
user_pref("security.ssl.tls.version.min", 3);
user_pref("toolkit.coverage.opt-out", true);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.server", "");
user_pref("toolkit.telemetry.unified", false);
```

## Resources

* https://docs.anyone.io
* https://github.com/anyone-protocol
* https://github.com/arkenfox/user.js
