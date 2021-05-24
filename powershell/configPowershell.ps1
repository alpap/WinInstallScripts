# powershell setup


function CopyDefaultProfileToPowershellFolder {
    $ConfigFilename = "Microsoft.PowerShell_profile.ps1"
    $ConfigFolder = "~/Documents/PowerShell"
    $ConfigFilePath = "~/Documents/PowerShell/" + $ConfigFilename

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
    $WindowsTerminalConfigFolder = "C:/Users/alpap/AppData/Local/Packages/Microsoft.WindowsTerminal_8wekyb3d8bbwe/LocalState"
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

function CopyThemeToFolder {
    $ThemeFilename = "alpap.psm1"
    $WindowsTerminalThemeFolder = "~/OneDrive/Documents/PowerShell/Modules/oh-my-posh/*/Themes"
    $WindowsTerminalThemeFile = $WindowsTerminalThemeFolder + "/" + $ThemeFilename

    if (!(Test-Path -Path $WindowsTerminalThemeFolder)) {
        mkdir $WindowsTerminalThemeFolder
        if (Test-Path -Path $WindowsTerminalThemeFile) {
            Remove-Item $WindowsTerminalThemeFile
        }
        Copy-Item ./powershell/${ThemeFilename} $WindowsTerminalThemeFolder
    }
    refreshenv
}

CopyDefaultProfileToPowershellFolder
CopyTerminalConfigToFolder
CopyThemeToFolder