
$ErrorActionPreference = ‘stop’

function InstallChocolatey {
    $ErrorActionPreference = ‘stop’
    if (!$(Get-Command choco).Name) {
        Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
    }

}

function InstallPackages {
    $apps = (Get-Content ./chocolatey/apps.txt)
    [string[]]$filteredApps = $apps | Where-Object { $_[0] -NotMatch '#' }
    foreach ($app in $filteredApps) {
        choco.exe install $app -y
    }
    refreshenv
}


InstallChocolatey

InstallPackages