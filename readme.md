# Windows apps installer

## Installation

First run the following to enable windows script execution on windows

```powershell
Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072;
```

Then run

```powershell
./install.ps1
```

## Changes happening

### chocolatey

Installs chocolatey afterwards all the apps in the apps.txt
The lines starting with a hash tag are commented out

### bash for windows

Installs powerline and replaces the theme with a custom one

### powershell

Installs powerline and sets the terminal config file to acustom one

### cleanup

removes useless apps from windows

## Future work

Find a way to install these packages in a generic way to support pther ones as wellInstall

- amd radeon software
- amd ryzen master
- binance
- sharksurf
- asus ai suidte 3
- foxit
