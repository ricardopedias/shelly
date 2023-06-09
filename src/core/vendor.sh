
vendorIsInstalled()
{
    if [[ -d "$(pathVendor)/" ]]; then
        echo "yes"
        return
    fi

    echo "no"
}

vendorInstall()
{
    if [[ "$(vendorIsInstalled)" == "yes" ]]; then
        showWarning "As bibliotecas externas já foram instaladas anteriormente";
        showInfo "Para atualizá-las, use a opção --update"
        return
    fi

    git clone --branch v2.1.8 https://github.com/kward/shunit2.git $(pathVendor)/shunit2

    exitSuccess
}

vendorUpdate()
{
    rm -Rf $(pathVendor)
    vendorInstall    
}
