$consent = Read-Host -Prompt "This script will unistall all softwares, tool form your device that were installed by windows.install.ps1, Are you sure you want to continue with this: y or n"

if ($consent -eq 'y') {

    gsudo choco uninstall wamp-server googlechrome git github-desktop visualstudio2019buildtools microsoft-windows-terminal vscode notepadplusplus postman visualstudio2019community  nodejs yarn gsudo  -y

    Write-Host "Disabling Developer Mode" -ForegroundColor Green
    reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "0"
    Set-ExecutionPolicy Bypass -Scope Process -Force;
}