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

Write-Host "Installing Google Chrome, Git, Github Desktop, Visual Studio Build Tools, Microsft Windows Terminal, Visual Studio Code, Notepad++" -ForegroundColor Green
gsudo choco install googlechrome git github-desktop visualstudio2019buildtools microsoft-windows-terminal vscode notepadplusplus


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


$node = Read-Host -Prompt "NodeJS"
$react = Read-Host -Prompt "React Scripts"
$yarn = Read-Host -Prompt "Yarn Package Manager"
# $mysql = Read-Host -Prompt "MySQL Server & Workbench"
$wamp = Read-Host -Prompt "WAMP server"
$visualStudio = Read-Host -Prompt "Visual Studio 2019 Community"
$postman = Read-Host -Prompt "Postman"


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

# if ($mysql -eq 'y') {
#     Write-Output "Installing MySQL Server"
#     choco install mysql -Wait

#     Write-Output "Installing MySQL Workbench"
#     choco install mysql.workbench -Wait
# }


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