@echo off
echo Cleaning up generated files and folders...

rd /s /q "%~dp0anon\anon_profile"
del /f /q "%~dp0Anon Launcher.lnk"
del /f /q "%~dp0anon\anon.exe"
del /f /q "%~dp0anon\anon-gencert.exe"
del /f /q "%~dp0anon\browser-with-proxy.lnk"
del /f /q "%~dp0anon\start_anon_browser.bat"

echo Cleanup complete.
pause
