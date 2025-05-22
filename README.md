# Anon Launcher
Anon Launcher for Firefox (& Chrome) on Windows

## Dependencies

* This setup only works on Windows systems (Tested on Windows 11 with PowerShell 7)
* Firefox or Chrome must already be installed on the system (If firefox can't be found the tool will look for Chrome)

### Disclaimer
It's recommended to install and use Firefox with this setup, which comes with enhanced privacy settings for the user profile.

Chrome is just a fallback option for simple access and demo purposes. It is not designed for enhanced security or privacy, just for easy access to the network.

## Demo Video of POC | Installation and Usage
See: https://x.com/cl0ten/status/1908302067946356865

## Install

Run the setup script

```
Run_Setup.bat
```
This will download "anon.exe", "anon-gencert.exe" and generate shortcuts for the browser.

## Usage

After installation, double click the "Anon Launcher" link to start "anon.exe" and launch Firefox with preconfigured proxy settings to localhost (127.0.0.1:9050) 

## File structure

### Important files  (check below for what files to delete if you want to run a fresh setup)

* README.md
* Run_Setup.bat
* Run_Cleanup.bat
* anon/create_shortcut.bat
* anon/create_shortcut.ps1


### Files to delete before starting a fresh setup 


* Anon Launcher.lnk
* anon/anon_profile/
* anon/anon.exe
* anon/anon-gencert.exe
* anon/browser-with-proxy.lnk
* anon/start_anon_browser.bat

You can also use the cleanup script to delete all the unwanted files automatically

```
Run_Cleanup.bat
```
Make sure the customised Firefox window and anon.exe is closed before running the Cleanup, files will not be cleaned when they are being used.

## File flow overview

```
Run_Setup.bat
  └── create_shortcut.bat
        └── create_shortcut.ps1
              └── Generates shortcuts and downloads Anyone tools

Anon Launcher
  └── start_anon_browser.bat
        ├── Launches anon.exe
        └── Launches browser-with-proxy.lnk
              └── Opens Firefox with proxy settings
```



## Troubleshooting

* Make sure anon.exe is running and isn't blocked by your firewall or antivirus.
* Investigate the anon.exe logs visible in the miminized anon.exe proxy window.
* Check if the "browser-with-proxy.lnk" has the right path to Firefox executable and proxy settings configured in the properties target path.
