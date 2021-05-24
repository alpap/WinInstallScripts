Import-Module posh-git
Import-Module oh-my-posh
Import-Module posh-github
Set-Theme alpap


function sudo {
    [string]$argsString = $args -join " "
    echo $argsString
    Start-Process -Verb RunAs "C:\Program Files\PowerShell\7\pwsh.exe" -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; ${argsString}"
}