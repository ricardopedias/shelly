
checkInstalation()
{
    if [[ -d "$(pathVendor)/" ]]; then
        return
    fi

    showWarning "As dependências do projeto não foram instaladas"
    showWarning "Por favor, execute --install"

    exit $EXIT_WITH_ERROR
}

doInstall()
{
    git clone --branch v2.1.8 https://github.com/kward/shunit2.git $(pathVendor)/shunit2
}
