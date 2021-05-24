Import-Module posh-git
Import-Module oh-my-posh
Set-Theme alpap

function sudo {
    [string]$argsString = $args -join " "
    Write-Output $argsString
    Start-Process -Verb RunAs "C:\Program Files\PowerShell\7\pwsh.exe" -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; ${argsString}"
}