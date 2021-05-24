
$ErrorActionPreference = ‘stop’

# function InstallChocolatey {
#     $ErrorActionPreference = ‘stop’
#     if (!$(Get-Command choco).Name) {
#         Set-ExecutionPolicy Bypass -Scope Process -Force; [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072; iex ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
#     }
#     refreshenv
# }

function InstallPackages {
    $apps = Get-Content ./apps.txt
    [string[]]$filteredApps = $apps | where { $_[0] -NotMatch '#' }
    [string]$appsString = $filteredApps -join " "
    choco.exe install $appsString -y
    refreshenv
}


# InstallChocolatey

InstallPackages