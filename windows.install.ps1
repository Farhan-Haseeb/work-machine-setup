Write-Host "Enabling Developer Mode" -ForegroundColor Green
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" /t REG_DWORD /f /v "AllowDevelopmentWithoutDevLicense" /d "1"
Set-ExecutionPolicy Bypass -Scope Process -Force;

try {
    choco --version
    Write-Host "Chocolatey already installed" -ForegroundColor Green
}
catch {
    Write-Host "Installing chocolatey" -ForegroundColor Green
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
    iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))

    $env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")
    Write-Host "Chocolatey Version" (choco --version) -ForegroundColor Green
    
}

choco feature enable -n allowGlobalConfirmation

try {
    gsudo -v
    Write-Host "gsudo already installed. Skipping gsudo installation." -ForegroundColor Green
}
catch {
    Write-Host "Install gsudo. (gsudo acts like sudo command for linux i.e. it gives admin privilege to your commands)" -ForegroundColor Green
    choco install gsudo
}

Write-Host "Updating ENVs" -ForegroundColor Green
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

Write-Host "Installing Google Chrome, Git, Microsft Windows Terminal, Notepad++" -ForegroundColor Green
gsudo choco install googlechrome git  microsoft-windows-terminal notepadplusplus


Write-Host "Updating ENVs" -ForegroundColor Green
$env:Path = [System.Environment]::GetEnvironmentVariable("Path","Machine") + ";" + [System.Environment]::GetEnvironmentVariable("Path","User")

git clone https://github.com/kerol2r20/Windows-terminal-context-menu
cd Windows-terminal-context-menu
gsudo .\SetupContextMenu.ps1

Write-Host "Removing Windows-terminal-context-menu repository" -ForegroundColor Green
cd ..
Remove-Item -Recurse -Force Windows-terminal-context-menu

Write-Host "To Install Windows Subsystem for Linux (WSL), please read Install Windows Subsystem for Linux.md" -ForegroundColor Green

Write-Host "Please type y or n to choose softwares/tools you want to install on your device. Type q to quit." -ForegroundColor Green

Write-Host "Select Text editors you want to keep on your system. Type and enter y or n." -ForegroundColor Green
$vscode = Read-Host -Prompt "Visual Studio Code"
$sublime = Read-Host -Prompt "Sublime Text"

Write-Host "Select servers you want to keep on your system. Type and enter y or n." -ForegroundColor Green
$node = Read-Host -Prompt "NodeJS"
$wamp = Read-Host -Prompt "WAMP server"

Write-Host "Select databases you want to keep on your system. Type and enter y or n." -ForegroundColor Green
# $mysql = Read-Host -Prompt "MySQL Server & Workbench"
$maria = Read-Host -Prompt "Maria DB"
$postgres = Read-Host -Prompt "postgres SQL"

Write-Host "Select other tools you want to keep on your system. Type and enter y or n." -ForegroundColor Green
$gitHubDesktop = Read-Host -Prompt "Github Desktop"
$react = Read-Host -Prompt "React Scripts"
$yarn = Read-Host -Prompt "Yarn Package Manager"
$visualStudio = Read-Host -Prompt "Visual Studio 2019 Community"
$postman = Read-Host -Prompt "Postman"

# Text Editors
if ($vscode -eq 'y'){
    choco install visualstudio2019buildtools vscode
}

if ($sublime -eq 'y'){
    choco install sublimetext3
}


# Servers
if ($node -eq 'y') {
    try {
        Write-Output "Checking NodeJS"
        node --version
        Write-Output "NodeJS already Installed"
    }catch {
        Write-Output "Installing NodeJS LTS"
        choco install nodejs-lts
    }
}

if ($wamp -eq 'y') {
    Write-Output "Installing WAMP Server"
    choco install wamp-server --ignore-checksums -Wait 
}

# Databases
# if ($mysql -eq 'y') {
#     Write-Output "Installing MySQL Server"
#     choco install mysql -Wait

#     Write-Output "Installing MySQL Workbench"
#     choco install mysql.workbench -Wait
# }

if ($maria -eq 'y') {
    Write-Output "Installing Maria DB"
    choco install mariadb
}
if ($postgres -eq 'y') {
    Write-Output "Installing Postgre SQL"
    choco install postgresql
}


# Other Tools
if ($gitHubDesktop -eq 'y') {
    choco install github-desktop
}

if ($yarn -eq 'y') {
    try {
        Write-Output "Checking Yarn Package Manager"
        yarn --version
        Write-Output "Yarn Package Manager already Installed"
    }
    catch {
        Write-Output "Installing Yarn Package Manager"
        choco install yarn
    }
}


if ($react -eq 'y') {
    try {
        Write-Output "Checking NodeJS"
        node --version
        Write-Output "NodeJS already Installed"
        Write-Output "Checking React Scripts"
        react-scripts --version
        Write-Output "React Scripts already Installed"
    } catch {
        Write-Output "Installing React Scripts globally"
        npm install -g react-scripts
    }
}

if ($visualStudio -eq 'y') {
    Write-Output "Installing Visual Studio 2019 Community"
    choco install visualstudio2019community
}

if ($postman -eq 'y') {
    Write-Output "Installing Postman"
    choco install postman
}