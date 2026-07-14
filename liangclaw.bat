@echo off
setlocal
chcp 65001 >nul
title AI Tools Installer

set "SCRIPT_DIR=%~dp0"
set "PS_SCRIPT=%SCRIPT_DIR%install_ai_tools.ps1"

if not exist "%PS_SCRIPT%" (
    echo ERROR: install_ai_tools.ps1 was not found.
    pause
    exit /b 1
)

%SystemRoot%\System32\WindowsPowerShell\v1.0\powershell.exe -NoLogo -NoProfile -ExecutionPolicy Bypass -File "%PS_SCRIPT%"
set "EXIT_CODE=%ERRORLEVEL%"

echo.
if not "%EXIT_CODE%"=="0" echo Installation finished with errors. Check install-log.txt.
if "%EXIT_CODE%"=="0" echo Installation completed. Check install-log.txt for details.
pause
exit /b %EXIT_CODE%
