function sudo {
    [string]$argsString = $args -join " "
    Write-Output $argsString "C:\Program Files\PowerShell\7\pwsh.exe" -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; ${argsString}"
}