# Work Machine Setup
Long awaited scripts to setup your new work machine.

# Windows Setup
Following [Setting up Windows for development](https://dev.to/himujjal/setting-up-windows-for-development-1628#:~:text=Follow%20the%20instructions%3A%201%20Press%20Win%20%2B%20I,loading%20finishes.%20Move%20on%20to%20the%20next%20step.) By: Himujjal Upadhyaya tutorial and handpick few other things compiled it an easy to run script.

## Requirements
For Windows 10 or later.

## Setting up pre-requisites
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
* Google Chrome

## Optional Tools
* NodeJS
* React Scripts
* Yarn Package Manager (for Node alternate of NPM)
* WAMP 
* Visual Studio (for asp and .net development)

# MacOS Setup
Some shell scripts to setup macos for developers. Please follow the below instructions to setup your mac for development.

## Requirements
For macos 11 Big Sur or later.

## Setting up pre-requisites
* Make sure you are on macos 11 Big Sur or later. A clean install is preferred.

* Install the macos Command-line tools:
  ```
  xcode-select --install
  ```

* If you need Xcode, please login to your apple account in AppStore and download/install Xcode. Then, set the command-line tools directory to point to Xcode:
  ```
  sudo xcode-select -s /Applications/Xcode.app/Contents/Developer
  ```

* Install homebrew:
  ```
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  ```

* Install ansible:
  ```
  brew install ansible
  ```

* Clone this repo:
  ```
  cd ~
  git clone https://github.com/Farhan-Haseeb/work-machine-setup.git
  ```

## Running brew installs
* If you have not already from some earlier setup repo or manual process installed common applications, please run the following brew scripts to install common applications on your mac:
  ```
    cd ~/work-machine-setup
    zsh mac.install.sh # install basic apps
  ```

* Additionally, you will need to set your terminal font (or just the non-ascii font for iTerm) to a powerline font for vim to display special characters nicely. This repo installs the fonts in macos. You will just need to select it from your terminal's preferences.

