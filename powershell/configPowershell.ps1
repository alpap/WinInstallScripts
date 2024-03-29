# powershell setup


function CopyDefaultProfileToPowershellFolder {
    $ConfigFilename = "Microsoft.PowerShell_profile.ps1"
    $ConfigFolder = "~/Documents/WindowsPowerShell"
    $ConfigFilePath = "~/Documents/WindowsPowerShell/" + $ConfigFilename

    if (!(Test-Path -Path $ConfigFolder)) {
        mkdir $ConfigFolder
    }
    if (Test-Path -Path $ConfigFilePath) {
        Remove-Item $ConfigFolder
    }

    Install-Module oh-my-posh -Scope CurrentUser -AllowPrerelease
    Install-Module posh-git -Scope CurrentUser -AllowPrerelease

    Copy-Item ./powershell/${ConfigFilename} $ConfigFolder
    refreshenv
}

# windows terminal configs
function CopyTerminalConfigToFolder {
    $ConfigFilename = "settings.json"
    $WindowsTerminalConfigFolder = "~/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
    $WindowsTerminalConfigFile = $WindowsTerminalConfigFolder + "/" + $ConfigFilename

    if (!(Test-Path -Path $WindowsTerminalConfigFolder)) {
        mkdir $WindowsTerminalConfigFolder
        if (Test-Path -Path $WindowsTerminalConfigFile) {
            Remove-Item $WindowsTerminalConfigFile
        }
        Copy-Item ./powershell/${ConfigFilename} $WindowsTerminalConfigFolder
    }
    refreshenv
}


CopyDefaultProfileToPowershellFolder
CopyTerminalConfigToFolder
