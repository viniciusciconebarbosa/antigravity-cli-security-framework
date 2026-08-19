@echo off
title Antigravity Security Toolkit Installer
echo =======================================================
echo    Antigravity Security Toolkit Installer (Windows)
echo =======================================================
echo.

powershell -NoProfile -ExecutionPolicy Bypass -File "%~dp0install.ps1"
pause
