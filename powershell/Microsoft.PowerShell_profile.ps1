function sudo {
    [string]$argsString = $args -join " "
    Write-Output $argsString
    Start-Process -Verb RunAs -Wait "C:\Program Files\PowerShell\7\pwsh.exe" -Args "-executionpolicy bypass -command Set-Location \`"$PWD\`"; ${argsString}"
}

function pkill {
    Stop-Process -Name $args[0] -Force
}

function kill{
    Stop-Process -ID $args[0] -Force
}
function gcp {
    git add .
    git commit -am "$(git status --porcelain)"
    git push
}

# Chocolatey profile
$ChocolateyProfile = "$env:ChocolateyInstall\helpers\chocolateyProfile.psm1"
if (Test-Path($ChocolateyProfile)) {
  Import-Module "$ChocolateyProfile"
}


Invoke-Expression (&starship init powershell)
