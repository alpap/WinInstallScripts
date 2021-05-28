


function configBash {
    $bashrcPath = "C:\Program Files\Git\etc\bash.bashrc"

    Write-Output 'eval "$(starship init bash)"' >> $bashrcPath
}

configBash