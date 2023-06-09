
shunitExecutable()
{
    echo "$(pathVendor)/shunit2/shunit2"
}

testStackStart()
{
    echo -e "$(startBlue)"
    echo -e "$(shapeLineFull)"
    echo -e "Running unit tests"
    echo -e "$(shapeLineFull)"
    echo -e "$(endBlue)"
}

runSearchTest()
{
    if [[ "$(vendorIsInstalled)" == "no" ]]; then
        showWarning "As dependências do projeto não foram instaladas"
        showWarning "Por favor, execute --install"
        exitError
    fi

    testStackStart

    search="$2"
    allTests=$(find $(pathTest) -maxdepth 5 -type f -name "*$search*")

    for file in $allTests
    do
        _runSingleTest "$file"
    done

    exitSuccess
}

runAllTests()
{
    if [[ "$(vendorIsInstalled)" == "no" ]]; then
        showWarning "As dependências do projeto não foram instaladas"
        showWarning "Por favor, execute --install"
        exitError
    fi

    testStackStart

    allTests=$(find $(pathTest) -maxdepth 5 -type f)

    for file in $allTests
    do
        _runSingleTest "$file"
    done

    exitSuccess
}

_runSingleTest()
{
    file="$@"

    if [[ ! -f $file ]]; then
        inRed $(shapeLineFull)
        showError File \"$file\" does not exists
        inRed $(shapeLineFull)
        
        exit $EXIT_WITH_ERROR
    fi

    basename="$(basename -- $file)"
    echo -e "Test: $basename\n$(shapeLineFull)"

    # variável de ambiente com o caminho do script de inicialização
    DSETUP_INIT="$(pathSrc)/init.sh"
    export DSETUP_INIT

    # variável de ambiente com o caminho da ferramenta de testes
    DSETUP_SHUNIT="$(pathVendor)/shunit2/shunit2"
    export DSETUP_SHUNIT

    echo -e $(cd $(dirname $file); bash "$file")

    echo -e "\n"
}
