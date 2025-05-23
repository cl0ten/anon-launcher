$baseFolder = Split-Path $MyInvocation.MyCommand.Definition
Set-Location $baseFolder

$anonZipPath = Join-Path $baseFolder "anon-temp.zip"

# get latest anon version tag
$releaseApiUrl = "https://api.github.com/repos/anyone-protocol/ator-protocol/releases/latest"
try {
    $latestRelease = Invoke-RestMethod -Uri $releaseApiUrl -Headers @{ "User-Agent" = "PowerShell" }
    $versionTag = $latestRelease.tag_name
    Write-Host "Latest version found: $versionTag"
} catch {
    Write-Host "Failed to retrieve latest version info. Exiting..." -ForegroundColor Red
    exit 1
}

# downloadoad the anon zip
$anonZipUrl = "https://github.com/anyone-protocol/ator-protocol/releases/download/$versionTag/anon-live-windows-signed-amd64.zip"
Write-Host "Downloading Anon release from $anonZipUrl..."
Invoke-WebRequest -Uri $anonZipUrl -OutFile $anonZipPath

# extract anon.exe and anon-gencert.exe
Add-Type -AssemblyName System.IO.Compression.FileSystem
$extractTempPath = Join-Path $baseFolder "temp_extracted"
[System.IO.Compression.ZipFile]::ExtractToDirectory($anonZipPath, $extractTempPath)

Move-Item -Path (Join-Path $extractTempPath "anon.exe") -Destination (Join-Path $baseFolder "anon.exe") -Force
Move-Item -Path (Join-Path $extractTempPath "anon-gencert.exe") -Destination (Join-Path $baseFolder "anon-gencert.exe") -Force

Remove-Item -Path $anonZipPath
Remove-Item -Recurse -Force -Path $extractTempPath

# browser locations
$firefoxPaths = @(
    "$Env:ProgramFiles\Mozilla Firefox\firefox.exe",
    "$Env:ProgramFiles(x86)\Mozilla Firefox\firefox.exe"
)

$chromePaths = @(
    "$Env:ProgramFiles\Google\Chrome\Application\chrome.exe",
    "$Env:ProgramFiles(x86)\Google\Chrome\Application\chrome.exe",
    "$Env:LocalAppData\Google\Chrome\Application\chrome.exe"
)

$browserExe = $null
$browserName = ""

# Firefox
foreach ($path in $firefoxPaths) {
    if (Test-Path $path) {
        $browserExe = $path
        $browserName = "Firefox"
        break
    }
}

# Chrome
if (-not $browserExe) {
    foreach ($path in $chromePaths) {
        if (Test-Path $path) {
            $browserExe = $path
            $browserName = "Chrome"
            break
        }
    }
}

# no supported browser found
if (-not $browserExe) {
    Write-Host "Neither Firefox nor Chrome is installed. Please install a supported browser and run this setup again." -ForegroundColor Red
    exit 1
}

# browser with proxy shortcut
$shortcutName1 = "browser-with-proxy.lnk"
$shortcutPath1 = Join-Path $baseFolder $shortcutName1
$proxyServer = "socks5://127.0.0.1:9050"
$WScriptShell = New-Object -ComObject WScript.Shell
$Shortcut1 = $WScriptShell.CreateShortcut($shortcutPath1)
$Shortcut1.TargetPath = $browserExe

if ($browserName -eq "Firefox") {
    
    # create profile folder and user.js with proxy config
    $anonProfilePath = Join-Path $baseFolder "anon_profile"

    if (Test-Path $anonProfilePath) {
    Remove-Item -Recurse -Force $anonProfilePath
    }
    New-Item -ItemType Directory -Path $anonProfilePath | Out-Null

    if (!(Test-Path $anonProfilePath)) {
        New-Item -ItemType Directory -Path $anonProfilePath | Out-Null
    }

    $userJs = @"
user_pref("network.proxy.type", 1);
user_pref("network.proxy.socks", "127.0.0.1");
user_pref("network.proxy.socks_port", 9050);
user_pref("network.proxy.socks_remote_dns", true);
user_pref("network.proxy.no_proxies_on", "");
user_pref("browser.privatebrowsing.autostart", true);
user_pref("general.useragent.locale", "en-US");
user_pref("intl.accept_languages", "en-US, en");
user_pref("media.peerconnection.enabled", false);
user_pref("extensions.pocket.enabled", false);
user_pref("toolkit.telemetry.enabled", false);
user_pref("toolkit.telemetry.unified", false);
user_pref("toolkit.telemetry.reportingpolicy.firstRun", false);
user_pref("toolkit.telemetry.cachedClientID", "");
user_pref("toolkit.telemetry.newProfilePing.enabled", false);
user_pref("toolkit.telemetry.server", "");
user_pref("browser.safebrowsing.enabled", false);
user_pref("browser.safebrowsing.phishing.enabled", false);
user_pref("browser.safebrowsing.malware.enabled", false);
user_pref("app.shield.optoutstudies.enabled", false);
user_pref("app.normandy.enabled", false);
user_pref("app.normandy.api_url", "");
user_pref("datareporting.policy.dataSubmissionEnabled", false);
user_pref("datareporting.healthreport.uploadEnabled", false);
user_pref("datareporting.healthreport.service.enabled", false);
user_pref("toolkit.coverage.opt-out", true);
user_pref("browser.crashReports.unsubmittedCheck.enabled", false);
user_pref("browser.search.suggest.enabled", false);
user_pref("network.http.sendRefererHeader", 0);
user_pref("media.eme.enabled", false);
user_pref("browser.newtabpage.activity-stream.enabled", false);
user_pref("identity.fxaccounts.enabled", false);
user_pref("identity.fxaccounts.remote.login.uri", "");
user_pref("geo.enabled", false);
user_pref("geo.provider.ms-windows-location", false);
user_pref("geo.provider.network.url", "");
user_pref("geo.wifi.uri", "");
user_pref("permissions.default.geo", 0);
user_pref("permissions.default.desktop-notification", 0);
user_pref("browser.search.countryCode", "US");
user_pref("browser.search.region", "US");
user_pref("browser.contentblocking.category", "strict");
user_pref("browser.urlbar.placeholderName.private", "DuckDuckGo");
user_pref("browser.urlbar.placeholderName", "DuckDuckGo");
user_pref("browser.search.defaultenginename", "DuckDuckGo");
user_pref("browser.search.selectedEngine", "DuckDuckGo");
user_pref("browser.search.hiddenOneOffs", "Google,Bing,Yahoo,Amazon.com,eBay,Wikipedia (en)");
user_pref("browser.search.openintab", true);
user_pref("browser.region.network.url", "");
user_pref("browser.region.update.enabled", false);
user_pref("browser.search.reset.enabled", false);
user_pref("browser.region.network.url", "");
user_pref("plugin.state.flash", 0);
user_pref("network.dns.disablePrefetch", true);
user_pref("network.prefetch-next", false);
user_pref("general.warnOnAboutConfig", false);
user_pref("extensions.getAddons.cache.enabled", false);
user_pref("extensions.getAddons.showPane", false);
user_pref("extensions.webservice.discoverURL", "");
user_pref("network.trr.mode", 5);
user_pref("privacy.resistFingerprinting", true);
user_pref("privacy.firstparty.isolate", true);
user_pref("network.cookie.cookieBehavior", 1);
user_pref("places.history.enabled", false);
user_pref("browser.formfill.enable", false);
user_pref("privacy.clearOnShutdown.history", true);
user_pref("privacy.clearOnShutdown.cookies", true);
user_pref("privacy.clearOnShutdown.formdata", true);
user_pref("security.ssl.require_safe_negotiation", true);
user_pref("security.cert_pinning.enforcement_level", 2);
user_pref("security.ssl.tls.version.min", 3);
user_pref("security.ssl.tls.version.max", 4);
user_pref("security.ssl.enable_ocsp_stapling", true);
user_pref("security.csp.enable", true);
user_pref("permissions.default.microphone", 0);
user_pref("permissions.default.camera", 0);
user_pref("privacy.trackingprotection.pbmode.enabled", true);
user_pref("privacy.resistFingerprinting.letterboxing", true);
user_pref("browser.download.manager.scanWhenDone", true);
user_pref("browser.download.useDownloadDir", false);
user_pref("network.trr.custom_uri", "");
user_pref("network.trr.uri", "");
user_pref("network.cookie.lifetimePolicy", 2);
"@

    $userJsPath = Join-Path $anonProfilePath "user.js"
    $userJs | Out-File -Encoding ASCII -FilePath $userJsPath

    $Shortcut1.Arguments = "-no-remote -profile `"$anonProfilePath`" -url https://check.en.anyone.tech https://arkenfox.github.io/TZP/tzp.html http://anyone.anon"
}
elseif ($browserName -eq "Chrome") {
    
    $Shortcut1.Arguments = "--incognito --proxy-server=$proxyServer http://anyone.anon https://arkenfox.github.io/TZP/tzp.html https://check.en.anyone.tech"
}

$Shortcut1.Save()

Write-Host "Shortcut for browser created successfully using $browserName."

# create the bat file that starts the browser
$batFilePath = Join-Path $baseFolder "start_anon_browser.bat"
$batchFileContent = @'
@echo off
rem starts anon.exe in minimized mode
start /min "" "%~dp0anon.exe"

rem starts the browser shortcut
start "" "%~dp0browser-with-proxy.lnk"
'@

$batchFileContent | Out-File -FilePath $batFilePath -Encoding UTF8

Write-Host "Batch file created successfully at: $batFilePath"

# create shortcut that launches the full stack (anon socks5 listener + browser w proxy settings)
$parentFolder = Split-Path $baseFolder -Parent
$shortcutName2 = "Anon Launcher.lnk"
$shortcutPath2 = Join-Path $parentFolder $shortcutName2

$Shortcut2 = $WScriptShell.CreateShortcut($shortcutPath2)
$Shortcut2.TargetPath = $batFilePath
$Shortcut2.WorkingDirectory = $baseFolder
$Shortcut2.IconLocation = $browserExe
$Shortcut2.Save()

Write-Host "Shortcuts created successfully."
