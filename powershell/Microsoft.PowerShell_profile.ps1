function sudo {
    [string]$argsString = $args -join " "
    Start-Process -Verb RunAs "C:\Program Files\PowerShell\7\pwsh.exe" -Args "-NoExit -executionpolicy bypass -command Set-Location \`"$PWD\`"; ${argsString}"
}

Invoke-Expression (&starship init powershell)