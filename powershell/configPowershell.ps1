# powershell setup


function CopyDefaultProfileToPowershellFolder {
    $ConfigFolder = "~/Documents/PowerShell"
    $ConfigFilePath = "~/Documents/PowerShell/Microsoft.PowerShell_profile.ps1"

    if (!(Test-Path -Path $ConfigFolder)) {
        mkdir $ConfigFolder
    }
    if (Test-Path -Path $ConfigFilePath) {
        Remove-Item $ConfigFolder
    }

    Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease

    Copy-Item ./Microsoft.PowerShell_profile.ps1 $ConfigFolder
    refreshenv
}

# windows terminal configs
function CopyTerminalConfigToFolder {
    $ConfigFilename = "settings.json"
    $WindowsTerminalConfigFolder = "C:\Users\alpap\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState"
    $WindowsTerminalConfigFile = $WindowsTerminalConfigFolder + "/" + $ConfigFilename

    if (!(Test-Path -Path $ConfigFolder)) {
        mkdir $WindowsTerminalConfigFolder
        if (Test-Path -Path $WindowsTerminalConfigFile) {
            Remove-Item $WindowsTerminalConfigFile
        }
        Copy-Item ./${ConfigFilename} $WindowsTerminalConfigFolder
    }
    refreshenv
}


CopyDefaultProfileToPowershellFolder
CopyTerminalConfigToFolder