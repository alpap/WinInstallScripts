
Write-Host "Installing windows apps"
./chocolatey/installChocoAndPackages.ps1
./bash/configBash.ps1
./powershell/configPowershell.ps1
./cleanup/removeApps.ps1