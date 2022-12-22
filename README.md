# Work Machine Setup
Long awaited scripts to setup your new work machine.

Following [Setting up Windows for development](https://dev.to/himujjal/setting-up-windows-for-development-1628#:~:text=Follow%20the%20instructions%3A%201%20Press%20Win%20%2B%20I,loading%20finishes.%20Move%20on%20to%20the%20next%20step.) By: Himujjal Upadhyaya tutorial and handpick few other things compiled it an easy to run script.

Open Windows PowerShell as Adminstrator
Execute the following script to gain asscess to run custom scripts `Set-ExecutionPolicy Bypass`.

After running the above command you can check if the desired change has been made or not by running `Get-ExecutionPolicy`, it should print `Bypass` in the terminal

Now navigate to the repository and run `.\windows.install.ps1`.

* This will activate the Developer Mode
* Install Chocolatey (which is windows' brew or wget)
* Gsudo `gsudo` (an alternate for windows of `sudo` or `su` for linux)
* Git
* Visual Studio Build Tools 
* Microsoft Windows Terminal (a very nice terminal experience)
* Visual Studio Code
* Notepad++
* Github Desktop

# Optional Tools
* NodeJS
* React Scripts
* Yarn Package Manager (for Node alternate of NPM)
* WAMP 
* Visual Studio (for asp and .net development)