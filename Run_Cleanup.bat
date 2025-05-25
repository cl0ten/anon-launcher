@echo off
echo Cleaning up generated files and folders...

pushd "%~dp0"
rd /s /q "anon\anon_profile"
del /f /q "Anon * Launcher.lnk"
del /f /q "anon\anon.exe"
del /f /q "anon\anon-gencert.exe"
del /f /q "anon\browser-with-proxy.lnk"
del /f /q "anon\start_anon_browser.bat"
popd

echo Cleanup complete.
pause
