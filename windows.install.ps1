Write-Host "Enabling Developer Mode" -ForegroundColor Green
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
Set-ExecutionPolicy Bypass -Scope Process -Force;

choco --version
if (echo $? -eq True) {
    Write-Host "Chocolatey already installed" -ForegroundColor Green
}
else {
    Write-Host "Installing chocolatey" -ForegroundColor Green
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    Write-Host "Chocolatey Version" -ForegroundColor Green
    choco --version
}

choco feature enable -n allowGlobalConfirmation

Write-Host "Install gsudo. (gsudo acts like sudo command for linux i.e. it gives admin privilege to your commands)" -ForegroundColor Green
choco install gsudo

Write-Host "Installing Git, Visual Studio Build Tools, Microsft Windows Terminal, Visual Studio Code, Notepad++" -ForegroundColor Green
gsudo choco install git visualstudio2019buildtools microsoft-windows-terminal vscode notepadplusplus.Install

git clone https://github.com/kerol2r20/Windows-terminal-context-menu
cd Windows-terminal-context-menu
gsudo .\SetupContextMenu.ps1

Write-Host "Removing Windows-terminal-context-menu repository" -ForegroundColor Green
cd ..
Remove-Item -Recurse -Force Windows-terminal-context-menu

Write-Host "To Install Windows Subsystem for Linux (WSL), please read Install Windows Subsystem for Linux.md" -ForegroundColor Green

Write-Host "Please type y or n to choose softwares/tools you want to install on your device. Type q to quit." -ForegroundColor Green


$node = Read-Host -Prompt "NodeJS"
$react = Read-Host -Prompt "React Scripts"
$yarn = Read-Host -Prompt "Yarn Package Manager"
# $mysql = Read-Host -Prompt "MySQL Server & Workbench"
$wamp = Read-Host -Prompt "WAMP server"


if ($node -eq 'y') {
    Write-Output "Checking NodeJS"
    node --version

    if (echo $? -eq True) {
         Write-Output "NodeJS already Installed"
    }
    else {
        Write-Output "Installing NodeJS LTS"
        choco install nodejs-lts
    }
   
}

if ($wamp -eq 'y') {
    Write-Output "Installing WAMP Server"
    choco install wamp-server -Wait
}

if ($yarn -eq 'y') {
     Write-Output "Checking Yarn Package Manager"
    yarn --version

    if (echo $? -eq True) {
         Write-Output "Yarn Package Manager already Installed"
    }
    else {
        Write-Output "Installing Yarn Package Manager"
        choco install yarn
    }
}

# if ($mysql -eq 'y') {
#     Write-Output "Installing MySQL Server"
#     choco install mysql -Wait

#     Write-Output "Installing MySQL Workbench"
#     choco install mysql.workbench -Wait
# }


if ($react -eq 'y') {
    Write-Output "Checking NodeJS"
    node --version

    if (echo $? -eq True) {
        Write-Output "NodeJS already Installed"
    }

    Write-Output "Checking React Scripts"
    react-scripts --version

    if (echo $? -eq True) {
        Write-Output "React Scripts already Installed"
    }
    Write-Output "Installing React Scripts globally"
    npm install -g react-scripts
}