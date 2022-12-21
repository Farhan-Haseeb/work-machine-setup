# Install Windows Subsystem for Linux (WSL)
This is the whole freaking Linux on your Windows. Yes. You heard it right.

WSL 1.0 is more of an simulated environment for Linux running on Windows NT kernel. But WSL 2.0 ships with a full Linux kernel!

We are going to install WSL 2.0. Let's get started.

1. Update Windows to 2004 edition.
a. Yes! For WSL 2.0, you need to update Windows 10 v2004 May 2020 edition. For manual update, download the updater [Windows May 2020](https://www.microsoft.com/en-us/software-download/windows10) Update And follow the screen instructions.
b. Update done? Restart your Windows and come back to this dev post.

2.  Enable Hyper-V
a. You computer also needs to support Hyper-V Virtualization to run WSL 2.
b. To enable Hyper-V, open Powershell and type in:
gsudo Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All
d. Restart your PC after the last command.

3. Install WSL:
There are two ways to intall WSL in Windows. First is through the Windows store. Windows Store is a bit tedious and really bad. Although it works fine for me. Anyways, we are going to install WSL without Windows Store.
    * Go to WSL install manual.
    * Download the distro of your choice from the link. We are going with Ubuntu 20.04.
    * An .appx will be downloaded.
    * In the folder where the distro is downloaded, simply open up terminal as we have done in the previous section.
    * Now put in the following code:
`Add-AppxPackage .\<your_download_distro_name>.appx`
In my case the name of the distro is `Ubuntu_2004.2020.424.0_x64.appx`
    * Now once your installation is done, in the same terminal put:
`dism.exe /online /enable-feature /featurename:VirtualMachinePlatform /all /norestart`
    * Restart your machine.
    * Now open terminal (wherever you like) and type: `wsl --set-default-version 2` That's it! From start menu open up Ubuntu.