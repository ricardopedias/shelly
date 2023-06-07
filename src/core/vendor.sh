
checkVendorInstalation()
{
    if [[ -d "$(pathVendor)/" ]]; then
        return
    fi

    showWarning "As dependências do projeto não foram instaladas"
    showWarning "Por favor, execute --install"

    exit $EXIT_WITH_ERROR
}

vendorInstall()
{
    git clone --branch v2.1.8 https://github.com/kward/shunit2.git $(pathVendor)/shunit2

    exit $EXIT_WITH_SUCCESS
}
