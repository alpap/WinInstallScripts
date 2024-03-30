Write-Host "Enabling Restore Point"
Enable-ComputerRestore -Drive "C:\"
Checkpoint-Computer -Description "setupWin11 Script" -RestorePointType "MODIFY_SETTINGS"

Write-Host "Installing windows apps"
./chocolatey/installChocoAndPackages.ps1
Write-Host "Configuring Bash"
./bash/configBash.ps1
Write-Host "Configuring Powershell"
./powershell/configPowershell.ps1
Write-Host "Cleaning up"
./cleanup/cleanup.ps1t