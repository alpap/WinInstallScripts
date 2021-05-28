


function configBash {
    $bashrcPath = "C:\Program Files\Git\etc\bash.bashrc"

    mkdir -p $HOME/.bash/themes/git_bash_windows_powerline
    git clone https://github.com/diesire/git_bash_windows_powerline.git $HOME/.bash/themes/git_bash_windows_powerline

    $setTheme = @"
THEME=$HOME/.bash/themes/git_bash_windows_powerline/theme.bash
if [ -f $THEME ]; then
. $THEME
fi
unset THEME
"@

    Write-Output $setTheme >> $bashrcPath

    # replace powerline theme with custom

    $themePath = "$HOME\.bash\themes\git_bash_windows_powerline"
    Remove-Item ${themePath}\theme.bash
    Copy-Item ./bash/theme.bash $themePath

}