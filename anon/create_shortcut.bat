@echo off
Powershell.exe -Command "Start-Process Powershell.exe -ArgumentList '-ExecutionPolicy Bypass -File \"%~dp0create_shortcut.ps1\"' -Verb RunAs"
