Winget install Microsoft.Powershell
winget install Microsoft.WindowsTerminal
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://community.chocolatey.org/install.ps1'))
winget install -e --id Git.Git
winget install Neovim.Neovim
winget install JanDeDobbeleer.OhMyPosh -s winget
winget install -e --id=JesseDuffield.lazygit
