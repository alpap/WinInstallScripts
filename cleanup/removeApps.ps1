


function RemoveApps {
    $apps = (Get-Content ./cleanup/apps.txt)
    [string[]]$filteredApps = $apps | Where-Object { $_[0] -NotMatch '#' }
    Foreach ($app in $filteredApps) {
        Write-host "Uninstalling:" $app
        Get-AppxPackage -allusers $app | Remove-AppxPackage
    }
    refreshenv
}

RemoveApps